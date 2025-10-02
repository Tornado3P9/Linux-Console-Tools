## date

Set or display the system date.  
More information: https://www.gnu.org/software/coreutils/date.  
```bash
# Display the current date using the default locale's format:
date +%c

# Display the current date in UTC, using the ISO 8601 format:
date -u +%Y-%m-%dT%H:%M:%S%Z

# Display the current date as a Unix timestamp (seconds since the Unix epoch):
date +%s

# Convert a date specified as a Unix timestamp to the default format:
date -d @1473305798

# Convert a given date to the Unix timestamp format:
date -d "2018-09-01 00:00" +%s --utc

# Display the current date using the RFC-3339 format (`YYYY-MM-DD hh:mm:ss TZ`):
date --rfc-3339=s

# Set the current date using the format `MMDDhhmmYYYY.ss` (`YYYY` and `.ss` are optional):
date 093023592021.59

# Display the current ISO week number:
date +%V

# Display the ISO date minus 1 day and 1 hour:
date -Ihours -d "1 hour ago 1 day ago"

# Display the date of the day before yesterday:
date --date='2 days ago'

# Display the date of the day three months and one day hence:
date --date='3 months 1 day'
```

the linux epoch existence time in seconds, `$(date +%s%3N)` for milliseconds
```bash
MYDATE="$(date +%s)-my-date"
echo $MYDATE                   # 1639767052-my-date

# get the human readable time format back from seconds:
date --date @1639767052        # Fri Dec 17 19:50:52 CET 2021
```

## timezones

https://www.digitalocean.com/community/tutorials/how-to-use-journalctl-to-view-and-manipulate-systemd-logs

If you wish to change the current time zone:
```bash
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

If you wish to create an alias for different time zones:
```bash
alias mytime='date +"%A %Y-%m-%d %T %Z (UTC%:z)"'
alias chinatime='TZ="Asia/Shanghai" date +"%A %Y-%m-%d %T %Z (UTC%:z)"'
alias germantime='TZ="Europe/Berlin" date +"%A %Y-%m-%d %T %Z (UTC%:z)"'
alias austriantime='TZ="Europe/Vienna" date +"%A %Y-%m-%d %T %Z (UTC%:z)"'
alias swisstime='TZ="Europe/Zurich" date +"%A %Y-%m-%d %T %Z (UTC%:z)"'
alias taiwantime='TZ="Asia/Taipei" date +"%A %Y-%m-%d %T %Z (UTC%:z)"'
alias portugaltime='TZ="Europe/Lisbon" date +"%A %Y-%m-%d %T %Z (UTC%:z)"'
alias irelandtime='TZ="Europe/Dublin" date +"%A %Y-%m-%d %T %Z (UTC%:z)"'
alias uktime='TZ="Europe/London" date +"%A %Y-%m-%d %T %Z (UTC%:z)"'
```

another option is:
```bash
dpkg-reconfigure tzdata
```

