## grep serial numbers

```bash
# https://www.cyberciti.biz/faq/linux-getting-scsi-ide-harddisk-information/
hdparm -I /dev/sda | grep "Serial Number:"
cat /sys/firmware/devicetree/base/serial-number

# https://lindevs.com/get-serial-number-of-raspberry-pi/
cat /proc/cpuinfo
cat /proc/cpuinfo | grep Serial | cut -d ' ' -f 2

# Or if having just a random number is enough
date +%s%N | cut -b10-19
```
