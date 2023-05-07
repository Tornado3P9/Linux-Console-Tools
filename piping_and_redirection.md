## Piping and Command Redirection

Piping Examples:
```bash
ls -lSh /etc/ | head             # see the first 10 files by size
ps -ef | grep sshd               # checking if sshd is running
ps aux --sort=-%mem | head -n 3  # showing the first 3 process by memory consumption
tree project_directory | less    # use the less text viewer to easily jump through the output
```

Command Redirection
```bash
# output redirection
ps aux > running_processes.txt
who -H > loggedin_users.txt

# appending to a file
id >> loggedin_users.txt

# output and error redirection
tail -n 10 /var/log/*.log > output.txt 2> errors.txt

# redirecting both the output and errors to the same file
tail -n 2 /etc/passwd /etc/shadow > output_errors.txt 2>&1

cat -n /var/log/auth.log | grep -ai "authentication failure" | wc -l
cat -n /var/log/auth.log | grep -ai "authentication failure" > auth.txt     # => piping and redirection

# The output is piped to the tee command, which displays the output to the terminal and writes the same information to the file disk_usage.txt
df -h | tee disk_usage.txt
```
