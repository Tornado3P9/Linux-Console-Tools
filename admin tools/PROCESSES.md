## Processes

```bash
##########################
## Process Viewing (ps, pstree, pgrep)
##########################
# checking if a command is shell built-in or executable file
type rm        # => rm is /usr/bin/rm
type cd        # => cd is a shell built-in

# displaying all processes started in the current terminal
ps

# displaying all processes running in the system
ps -ef
ps -ef | wc -l      # counting number of processes
ps aux
ps aux | less       # piping to less

# sorting by memory and piping to less
ps aux --sort=%mem | less

# ASCII art process tree
ps -ef --forest

# displaying all processes of a specific user
ps -f -u username

# checking if a process called sshd is running
pgrep -l sshd
ps -ef | grep sshd

#displaying a hierarchical tree structure of all running processes
pstree

# merging identical branches
pstree -c

##########################
## Killing processes (kill, pkill, killall)
##########################

# listing all signals
kill -l

# sending a signal (default SIGTERM - 15) to a process by pid 
kill 12547   # kill pid

# sending a signal to more processes
kill -SIGNAL pid1 pid2 pid3 ...

# sending a specific signal (SIGHUP - 2) to a process by pid
kill -2 pid
kill -HUP pid
kill -SIGHUP pid

# sending a signal (default SIGTERM - 15) to process by process name
pkill process_name          # => Ex: pkill sleep
killall process_name
kill $(pidof process_name)  # => Ex: kill -HUP $(pidof sshd)

# running a process in the background
sleep 100 &   # command &

# Showing running jobs
jobs

# Stopping (pausing) the running process
Ctrl + Z

# resuming and bringing to the foreground a process by job_d
fg %job_id

# resuming in the background a process by job_d
bg %job_id

# starting a process immune to SIGHUP
nohup wget http://site.com &   # nohup command &
```
Alternative commands for `nohub`:  
https://www.gnu.org/software/screen/  
https://github.com/tmux/tmux/wiki  

