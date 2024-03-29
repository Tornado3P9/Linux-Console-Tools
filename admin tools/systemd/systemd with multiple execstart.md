# Systemd with multiple execStart[^1]

if `Type=simple` in your unit file, you can only specify one ExecStart, but you can add as many `ExecStartPre`, `ExecStartPost`, but none of this is suited for long running commands, because they are executed serially and everything one start is killed before starting the next one.  
If `Type=oneshot` you can specify multiple ExecStart, they run serially not in parallel.  
If what you want is to run multiple units in parallel, there a few things you can do:  

### If they differ on 1 param

You can use template units, so you create a `/etc/systemd/system/foo@.service`. **NOTE:** (the `@` is important).
```shell
[Unit]
Description=script description %I

[Service]
Type=simple
ExecStart=/script.py %i
Restart=on-failure

[Install]
WantedBy=multi-user.target
```

And then you exec:
```bash
systemctl start foo@parameter1.service foo@parameter2.service
```

or...

### Target dependencies

You can create multiple units that link to a single target:

```bash
#/etc/systemd/system/bar.target
[Unit]
Description=bar target
Requires=multi-user.target
After=multi-user.target
AllowIsolate=yes

[Install]
WantedBy=multi-user.target
```

And then you just modify your .service units to be `WantedBy=bar.target` like:

```bash
#/etc/systemd/system/foo@.service
[Unit]
Description=script description %I

[Service]
Type=simple
ExecStart=/script.py %i
Restart=on-failure

[Install]
WantedBy=bar.target
```

Then you just enable the foo services you want in parallel, and start the bar target like this:

```bash
systemctl daemon-reload
systemctl enable foo@param1.service
systemctl enable foo@param2.service
systemctl start bar.target
```

**NOTE:** that this works with any type of units not only template units.  

But note that `systemctl stop bar.target` doesn't stop any of these linked services.  
So you have to either stop each service one by one  
or use the `*` asterisk to apply your command to multiple processes:  

```bash
## Display all services together:
systemctl status foo@*

## Stopping all services together:
systemctl stop foo@*
```

[^1]: Systemd with multiple execStart https://stackoverflow.com/questions/48195340/systemd-with-multiple-execstart
