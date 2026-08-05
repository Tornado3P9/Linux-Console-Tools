# Creating a custom startup service for a specific user

Auf einem Recording PC soll beim Login der letzte Verlauf von thunar (file explorer) entfernt werden, damit für jedes neue Recording eine saubere Umgebung besteht und keine "recently used" optionen von thunar "freundlicherweise" jedes Mal angezeigt werden, jedes Mal, wenn man was öffnet.

```bash
sudo nano /etc/systemd/system/thunar-recent-clean@.service
```

Inhalt:

```ini
[Unit]
Description=Clear XDG recently-used for user %i (Thunar)
DefaultDependencies=no
Before=display-manager.service
After=local-fs.target

[Service]
Type=oneshot
User=root
ExecStart=/usr/bin/find /home/%i/.local/share -maxdepth 1 -type f -name 'recently-used.xbel*' -delete

[Install]
WantedBy=multi-user.target
```

Aktivieren (Username einsetzen, z.B. `recording`):

```bash
sudo systemctl daemon-reload
sudo systemctl enable --now thunar-recent-clean@recording.service
```

Testlauf:

```bash
sudo systemctl start thunar-recent-clean@recording.service
```
