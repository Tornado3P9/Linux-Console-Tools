# zram

Linux with Btrfs can run without a traditional disk-based swap partition or swapfile, but it may still use **zram** by default.

- **zram:** Compressed swap stored in RAM; Fedora/RHEL commonly enables it automatically. It helps when memory is tight without using disk.
- **Disk swap:** Still useful for workloads that exceed physical RAM, memory-intensive applications, or hibernation.
- **Hibernation:** Requires persistent swap large enough to hold the hibernated memory image; zram alone generally cannot provide this.
- **Btrfs swapfiles:** They require special handling because swapfiles must not use Btrfs compression or copy-on-write. A normal file created with `fallocate` may not work correctly.

Check what your system is currently using:

```bash
swapon --show
free -h
```

If `swapon --show` lists something like `/dev/zram0`, you already have compressed swap. For a typical desktop with adequate RAM and no hibernation requirement, a zram-only setup is often sufficient.

You would only want persistent disk swap if:

- You need **hibernation**.
- You regularly run applications that exceed your available RAM.
- You run virtual machines, large builds, data processing, or other memory-heavy workloads.
- You want an additional safety margin against out-of-memory kills.

You can confirm the zram setup with:

```bash
zramctl
```
