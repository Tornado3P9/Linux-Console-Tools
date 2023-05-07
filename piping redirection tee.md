## Piping, Command Redirection and `tee`

Piping Examples:
```bash
ls -lSh /etc/ | head             # see the first 10 files by size
ps -ef | grep sshd               # checking if sshd is running
ps aux --sort=-%mem | head -n 3  # showing the first 3 process by memory consumption
tree project_directory | less    # use the less text viewer to easily jump through the output
```

Command Redirection:
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

**tee** Examples (the *tee fork* splits the stream into two outputs):
```bash
# This program is part of the coreutils package which is being installed by default
apt show coreutils

# Example: write to file and display at the same time, similar to `>`
echo "Hello World!" | tee file.txt

# Example: Append to the given files, do not overwrite, similar to `>>`
echo "example" | tee -a file.txt

# Example: Create a telegraf configuration file
tee  /etc/telegraf/telegraf.conf << END
[global_tags]

[agent]
  interval = "10s"
  round_interval = true
  metric_batch_size = 1000
  metric_buffer_limit = 10000
  collection_jitter = "0s"
  flush_jitter = "0s"
  precision = ""
  debug = false
  quiet = false
  logfile = ""

[[outputs.file]]
    files = ["stdout", "/var/log/telegraf/metrics.log" ]

[[inputs.disk]]
  # mount_points = ["/"]
  ignore_fs = ["tmpfs", "devtmpfs", "devfs"]
END

# Creating private and public wireguard keys
# using tee to write one output to the file 'privatekey' while piping the other
wg genkey | tee privatekey | wg pubkey > publickey
```
https://linuxize.com/post/linux-tee-command/

