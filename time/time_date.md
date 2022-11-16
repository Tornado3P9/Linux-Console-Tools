## time and date

https://www.digitalocean.com/community/tutorials/how-to-use-journalctl-to-view-and-manipulate-systemd-logs

If you wish to change the current time zone:
```bash
# display the date
date

# show time zone and more
timedatectl
# same as
timedatectl status

# show all available timezones
timedatectl list-timezones

# choose a timezone and set it as default
zone = 'Europe/Berlin'
sudo timedatectl set-timezone $zone
```

another option is:
```bash
dpkg-reconfigure tzdata
```

the linux epoch existence time in seconds, `$(date +%s%3N)` for milliseconds
```bash
MYDATE="$(date +%s)-my-date"
echo $MYDATE                   # 1639767052-my-date

# get the human readable time format back from seconds:
date --date @1639767052        # Fri Dec 17 19:50:52 CET 2021
```
