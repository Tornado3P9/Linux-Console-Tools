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

**loginctl** and **lslogins**
```bash
# Print all current sessions:
loginctl

# Print all properties of a specific session:
loginctl show-session session_id [-a|--all]

# Print all properties of a specific user:
loginctl show-user username

# Print a specific property of a user:
loginctl show-user username [-p|--property] property_name

# Execute a loginctl operation on a remote host:
loginctl list-users [-H|--host] hostname

# Log a user out on all of their sessions:
loginctl terminate-user username
```
