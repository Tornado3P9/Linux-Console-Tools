# at

Executes commands at a specified time.  
More information: https://man.archlinux.org/man/at.1.  

## Create Jobs

```bash
# Open an `at` prompt to create a new set of scheduled commands, press `Ctrl + D` to save and exit:
at hh:mm

# Execute the commands and email the result using a local mailing program such as Sendmail:
at hh:mm -m

# Execute a script at the given time:
at hh:mm -f path/to/file
at hh:mm mmddjj -f path/to/file

# Display a system notification at 11pm on February 18th:
echo "notify-send 'Wake up!'" | at 11pm Feb 18
```

## Show Jobs

```bash
# Show which jobs are scheduled to run at a later time:
atq

# Show jobs of all users:
sudo atq
```

## Remove Jobs

```bash
# Remove the job using its ID:
atrm 3    # 3 being the job number that you get with the command 'atq'

# Remove many jobs, separated by spaces:
atrm 15 17 22
```
