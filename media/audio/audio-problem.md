try restart
```bash
pulseaudio -k
sudo alsa force-reload
```

Speakers buzzing in Linux when no sound is playing (https://youtu.be/1ke0YGJ2k2o)
```bash
sudo nano /etc/pulse/default.pa
# comment out a this line: load-module module-suspend-on-idle
```
