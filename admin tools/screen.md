# screen

### Session starten

```bash
screen -S projekt
```

Du befindest dich jetzt innerhalb der Screen-Session. Starte dort zum Beispiel:

```bash
python3 -m http.server 8000
```

### Session verlassen, ohne sie zu beenden

Drücke:

```text
Strg+a, danach d
```

Also: `Strg+a` drücken, loslassen, danach `d`.

Das nennt man **Detach**. Der Server oder Befehl läuft weiter.

### Vorhandene Sessions anzeigen

```bash
screen -ls
```

Beispiel:

```text
There is a screen on:
    12345.projekt    (Detached)
```

### Wieder verbinden

```bash
screen -r projekt
```

Oder mit der ID:

```bash
screen -r 12345
```

### Session beenden

Verbinde dich zunächst:

```bash
screen -r projekt
```

Dann beendest du die Shell mit:

```bash
exit
```

Wenn das letzte Programm beendet ist, wird auch die Screen-Session geschlossen.

### Nützliche Tastenkombinationen

| Tastenkombination | Funktion |
|---|---|
| `Strg+a`, `d` | Session verlassen, Programme laufen weiter |
| `Strg+a`, `c` | Neues Fenster erstellen |
| `Strg+a`, `n` | Nächstes Fenster |
| `Strg+a`, `p` | Vorheriges Fenster |
| `Strg+a`, `0` bis `9` | Zu Fenster wechseln |
| `Strg+a`, `k` | Aktuelles Fenster beenden |
| `Strg+a`, `?` | Hilfe anzeigen |

Wenn `screen` noch nicht installiert ist:

```bash
sudo apt install screen
```

Auf Fedora/RHEL:

```bash
sudo dnf install screen
```

Ein typischer Ablauf über SSH ist:

```bash
ssh benutzer@server
screen -S arbeit
./mein-programm
```

Dann `Strg+a`, `d` drücken. Später:

```bash
ssh benutzer@server
screen -r arbeit
```
