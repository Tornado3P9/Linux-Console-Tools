# https://linuxize.com/post/linux-tee-command/

This program is part of the coreutils package which is being installed by default
```bash
apt show coreutils
```

Example: write to file and display at the same time
```bash
echo "Hello World!" | tee file.txt
```

Example: Append to the given files, do not overwrite, similar to `>>`
```bash
echo "example" | tee -a file.txt
```

Example: Create a telegraf configuration file
```bash
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
```

Creating private and public wireguard keys
```bash
wg genkey | tee privatekey | wg pubkey > publickey
```
