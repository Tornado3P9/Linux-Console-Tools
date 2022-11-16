## login

Tipp: find MyUsername by typing `whoami` inside the terminal
```bash
nano /usr/share/lightdm/lightdm.conf.d/60-xubuntu.conf
```

then you can edit the textfile like this to make it login automatically
```bash
[Seat:*]
user-session=xubuntu
autologin-guest=false
autologin-user=MyUsername 
autologin-user-timeout=0
```
