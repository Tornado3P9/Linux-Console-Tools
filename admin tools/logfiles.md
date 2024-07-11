# Logging

```bash
# Manually create an error message to simulate some event occuring on the system for troubleshooting
logger Critical Error Has Occured!   # (logs the message 'Critical Error Has Occured!')

# Viewing the System Log File
# https://linuxhandbook.com/journalctl-command/  https://www.loggly.com/ultimate-guide/using-journalctl/
# https://linuxhandbook.com/clear-systemd-journal-logs/  https://www.digitalocean.com/community/tutorials/how-to-use-journalctl-to-view-and-manipulate-systemd-logs
# https://sematext.com/blog/journald-logging-tutorial/   https://www.freedesktop.org/software/systemd/man/journald.conf.html  https://www.freedesktop.org/software/systemd/man/journalctl.html
# https://www.freedesktop.org/software/systemd/man/systemd-journal-upload.html  https://www.freedesktop.org/software/systemd/man/systemd-journal-remote.service.html
journalctl
journalctl -e | grep ens192           # (grep just the lines that we are looking for)
journalctl -f                         # (keep monitoring most recent journal entries)
journalctl -r                         # (Reverse output so that the newest entries are displayed first)

# Searching Through a Log File
ls /var/log                           # (list logfiles)
cat /var/log/boot.log | grep OpenSSH  # (grep just the lines that we are looking for)
grep $USER /var/log/syslog            # (grep from inside the file syslog just the lines that contain your username)

# Monitoring a Log File
tail -f /var/log/firewalld            # (go to the end and keep monitoring)
tail -n 15 -f /var/log/auth.log       # (display the last 15 lines of the authentication-tries-logfile as the file is updated, in real time)
tail /var/log/syslog                  # (display systemctl logs)

# Viewing Boot Messages
journalctl -b -2         # (look up the messages from the specified system-boot starting at the end of the journal) - used often
journalctl -b 4          # (display the messages that were created at the forth boot found from the beginning of the journal) - seldom used

# Viewing Service-Specific Messages
journalctl -u ssh                     # (display systemctl logs from ssh)
journalctl -u mysqld                  # (display systemctl logs from mysql)
journalctl -u docker -f               # (tail/live-display the systemctl logs from docker)

#To check on how the service is running today, you can type:
journalctl -u ssh.service --since=today                    # (display ssh logs from today beginning with 00:00:00)
journalctl -u ssh.service -S today --no-tail > test.log    # (write the output into a text file)
journalctl -u ssh.service -S today -o json-pretty          # (display easy to read json format)
journalctl -u ssh.service -S today -xe                     # (display extended information)

#'ls /var/log/journal/' can not be viewed with 'cat' or 'less'
# journalctl has to be used

# The behavior of the journal-damon is configured using the '/etc/systemd/journal.conf' file
# Different options (taking MaxLevelStore as an example) are:
# emerg   (0)
# alert   (1)
# crit    (2)
# err     (3)
# warning (4)
# notice  (5)
# info    (6)
# debug   (7) = storing also everything above

# the 'dmesg' command is used to view the kernel ring buffer
# To print out the dmesg to a simple textfile for further use:
dmesg > ~/boot.dmeg
cat ~/boot.dmeg

# simple text tools: cat, less, head, tail

# inside '/var/log' the 'wtmp' file contains a list of all users who have authenticated to this linux system
# this file is a binary file which is why the 'simple text tools' can not be used:
last
lastb   # for bad logins, meaning failed logins that might be a hackers' attempt to break in

# the 'lastlog' file contains a log of the last time each user authenticated to the system
# it's also a binary file:
lastlog
```
