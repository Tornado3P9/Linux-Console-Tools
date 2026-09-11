# Moving the /home directory

**Back up important data first.** The formatting step will erase the selected SSD.

### 1. Identify the external SSD

```bash
lsblk -o NAME,SIZE,FSTYPE,UUID,MOUNTPOINTS,MODEL
```

Assume the external partition is `/dev/sdb1`. Replace that with the correct device on your system—do not guess.

### 2. Format it

For a separate `/home`, ext4 is straightforward:

```bash
sudo umount /dev/sdb1 2>/dev/null
sudo mkfs.ext4 -L home /dev/sdb1
```

If you specifically want Btrfs, use:

```bash
sudo mkfs.btrfs -L home /dev/sdb1
```

### 3. Mount it temporarily

```bash
sudo mkdir /mnt/newhome
sudo mount /dev/sdb1 /mnt/newhome
```

### 4. Copy your existing home directory

Ideally, do this from a TTY or a live USB so your user files are not changing during the copy. From a TTY, press `Ctrl`+`Alt`+`F3`, log in, and stop the graphical session if necessary.

Then copy the data with [#rsync]:

```bash
sudo rsync -aAXH --info=progress2 /home/ /mnt/newhome/
```

The trailing slash after `/home/` is important.

Check that the copy completed:

```bash
sudo du -sh /home /mnt/newhome
```

### 5. Preserve the old home and create a new mount point

```bash
sudo mv /home /home.old
sudo mkdir /home
```

Do not delete `/home.old` yet.

### 6. Get the filesystem UUID

```bash
sudo blkid /dev/sdb1
```

You will see something like:

```text
UUID="abcd-1234-..." TYPE="ext4"
```

### 7. Add it to `/etc/fstab`

Open the file:

```bash
sudo nano /etc/fstab
```

Add a line using your actual UUID.

For ext4:

```fstab
UUID=abcd-1234-...  /home  ext4  defaults  0  2
```

For Btrfs:

```fstab
UUID=abcd-1234-...  /home  btrfs  defaults  0  0
```

Because this is an external SSD, you may prefer:

```fstab
UUID=abcd-1234-...  /home  ext4  defaults,x-system.device-timeout=10  0  2
```

If you add `nofail`, Linux can boot without the drive, but `/home` would then be an empty directory on the root filesystem, which can be confusing and potentially problematic:

```fstab
UUID=abcd-1234-...  /home  ext4  defaults,nofail,x-system.device-timeout=10  0  2
```

### 8. Test the configuration before rebooting

```bash
sudo mount -a
findmnt /home
```

You should see the external SSD mounted at `/home`.

Then verify your files:

```bash
ls -la /home
```

If SELinux reports issues, relabel the new home directory:

```bash
sudo restorecon -RFv /home
```

Once you have rebooted successfully and confirmed everything works, remove the old copy to recover space:

```bash
sudo rm -rf /home.old
```

### rsync


```bash
sudo rsync -aAXH --info=progress2 /home/ /mnt/newhome/
```

Dabei bedeutet:

- `-a`: rekursiv kopieren und unter anderem Rechte, Besitzer, Gruppen, Zeitstempel und Symlinks erhalten
- `-A`: POSIX-ACLs erhalten
- `-X`: Extended Attributes erhalten, wichtig unter Fedora/RHEL unter anderem für SELinux
- `-H`: Hardlinks erhalten
- `/home/` mit abschließendem `/`: kopiert den Inhalt von `home`, nicht den Ordner selbst

Ich würde zusätzlich `--numeric-ids` verwenden:

```bash
sudo rsync -aAXH --numeric-ids --info=progress2 /home/ /mnt/newhome/
```

Das verhindert, dass Besitzer und Gruppen anhand ihrer Namen aufgelöst werden. Stattdessen werden die numerischen UID- und GID-Werte unverändert übernommen. Das ist besonders wichtig, wenn das neue System andere Benutzerdefinitionen oder noch keine Benutzerkonten besitzt.

Falls sich innerhalb von `/home` weitere eingehängte Dateisysteme befinden, kannst du mit `-x` verhindern, dass rsync diese ebenfalls durchläuft:

```bash
sudo rsync -aAXH --numeric-ids -x --info=progress2 /home/ /mnt/newhome/
```

`-x` steht für „eine Dateisystemgrenze nicht überschreiten“. Verwende es nur, wenn wirklich ausschließlich die eigentliche Home-Partition kopiert werden soll.

Vor dem eigentlichen Kopieren empfiehlt sich ein Testlauf:

```bash
sudo rsync -aAXHn --numeric-ids /home/ /mnt/newhome/
```

`-n` bedeutet „nur anzeigen, nichts verändern“.

Anschließend kannst du die Übertragung prüfen:

```bash
sudo rsync -aAXHn --numeric-ids --itemize-changes /home/ /mnt/newhome/
```

Wenn dabei keine Änderungen mehr angezeigt werden, sind Quelle und Ziel aus Sicht von rsync synchron.

Wichtig:

- Das Ziel-Dateisystem muss Unix-Rechte, Besitzer, ACLs und Extended Attributes unterstützen. **ext4** oder **XFS** sind dafür geeignet.
- Kopiere möglichst aus einem Live-System oder nachdem Benutzer, grafische Sitzung und laufende Programme beendet wurden. Sonst können sich Dateien während des Kopierens ändern.
- `--delete` brauchst du nicht für eine erstmalige Kopie. Es löscht Dateien im Ziel, die in der Quelle nicht existieren, und sollte nur bewusst verwendet werden.
- Falls du sehr große Sparse-Dateien hast, kannst du zusätzlich `-S` verwenden:

  ```bash
  sudo rsync -aAXHS --numeric-ids --info=progress2 /home/ /mnt/newhome/
  ```

Für eine normale Übertragung wäre daher typischerweise dieser Befehl passend:

```bash
sudo rsync -aAXH --numeric-ids --info=progress2 /home/ /mnt/newhome/
```

Nach dem Kopieren kannst du stichprobenartig prüfen:

```bash
ls -laZ /mnt/newhome
getfacl /mnt/newhome
getfattr -d -m- /mnt/newhome
```

`ls -Z` zeigt dabei die SELinux-Kontexte an.
