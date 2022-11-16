## Disable Snaps

This goes over how to Disable Snaps and making sure it doesn’t automatically reinstall.

List and Uninstall Snaps
```bash
snap list                # This shows you what snaps are installed
sudo snap remove program # remove all snaps listed above
```

Purge Snaps and Block Reinstall
```bash
sudo apt purge snapd
sudo apt-mark hold snapd
```

Verify Uninstall
```bash
apt list --installed | grep snap
```

you could also use an ALIAS
```bash
alias snapstop='sudo systemctl stop snapd.service'
alias snapmask='sudo systemctl mask snapd.service'
alias snapunmask='sudo systemctl unmask snapd.service'
alias snapstart='sudo systemctl start snapd.service'
```
