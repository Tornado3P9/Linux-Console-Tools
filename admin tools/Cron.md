## Task Scheduling using Cron

```bash
# editing the current user’s crontab file 
crontab -e

# listing the current user’s crontab file 
crontab -l

# removing the current user’s crontab file 
crontab -r

#  * * * * * command_to_execute
#  - - - - -
#  | | | | |
#  | | | | +---- Day of the week (0 - 7) (Sunday=0 or 7)
#  | | | +------ Month (1 - 12)
#  | | +-------- Day of the month (1 - 31)
#  | +---------- Hour (0 - 23)
#  +------------ Minute (0 - 59)
#
# Each field can have a specific value, a range of values (2-5),  
# a list of values separated by commas (1,3,5), or an asterisk (*)  
# which represents all possible values for that field.

# 1 Open a terminal window.
# 2 Type crontab -e to edit the cron jobs for your user.
# 3 Add the following line to the crontab file to schedule a popup every 45 minutes:
*/45 * * * * DISPLAY=:0 /usr/bin/notify-send "Reminder" "Your custom text message here"

## COMMON EXAMPLES ##
# run every minute
* * * * * /path_to_task_to_run.sh

# run every hour at minute 15
15 * * * * /path_to_task_to_run.sh

# run every day at 6:30 PM
30 18 * * * /path_to_task_to_run.sh

# run every Monday at 10:03 PM
3 22 * * 1 /path_to_task_to_run.sh

# run on the 1st of every Month at 6:10 AM
10 6 1 * * /path_to_task_to_run.sh

# run every hour at minute 1, 20 and 35
1,20,35 * * * * /path_to_task_to_run.sh

# run every two hour at minute 10
10 */2 * * * /path_to_task_to_run.sh

# run once a year on the 1st of January at midnight
@yearly     /path_to_task_to_run.sh

# run once a month at midnight on the first day of the month
@monthly    /path_to_task_to_run.sh

# run once a week at midnight on Sunday
@weekly      /path_to_task_to_run.sh

# once an hour at the beginning of the hour
@hourly     /path_to_task_to_run.sh

# run at boot time
@reboot     /path_to_task_to_run.sh

# All scripts in following directories will run as root at that interval:
/etc/cron.hourly
/etc/cron.daily  
/etc/cron.hourly  
/etc/cron.monthly
/etc/cron.weekly
```
