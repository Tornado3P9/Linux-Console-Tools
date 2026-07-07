`systemd-analyze` is a command-line tool used to analyze and troubleshoot the boot-up performance of a Linux system running `systemd`. It provides insights into the time taken by each service and the overall boot process.

### Example Usage:

1. **Basic Boot Time Analysis:**
   ```bash
   systemd-analyze
   ```
   This command will display the total time taken for the kernel, initrd, and userspace to boot.

2. **Blame for Slow Boot:**
   ```bash
   systemd-analyze blame
   ```
   This lists all running services, sorted by the time they took to start, helping identify slow services.

3. **Critical Chain:**
   ```bash
   systemd-analyze critical-chain
   ```
   This shows the time-critical chain of units, highlighting which services are delaying the boot process.

4. **Plot Boot Process:**
   ```bash
   systemd-analyze plot > boot.svg
   ```
   This generates a graphical representation of the boot process and saves it as an SVG file.
