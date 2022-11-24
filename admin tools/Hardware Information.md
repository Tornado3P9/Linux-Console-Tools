## Getting System Hardware Information

displaying full hardware information
```bash
lshw
lshw -short     # => short format
lshw -json      # => json format
lshw -html      # => html format
lshw | less     # => piping output to less for better viewability
lshw -html > hw.html
inxi -Fx
```

displaying info about the CPU
```bash
lscpu
lshw -C cpu
lscpu -J    => json format
```

displaying info about the installed RAM memory
```bash
dmidecode -t memory 
dmidecode -t memory | grep -i size
dmidecode -t memory | grep -i max
hwinfo --memory

# displaying info about free/used memory  https://linux-audit.com/understanding-memory-information-on-linux-systems/
free -m                 # => show output in mebibytes
free -h                 # => human readable
vmstat -s | grep memory
sysctl vm.swappiness    # => show value of how much the system should try to use swap (which is very slow and therefore should not be used very often)
                             the lower the swappiness, the less likely swap is going to be used
```

getting info about pci buses and about the devices connected to them
```bash
lspci
lspci | grep -i wireless
lspci | grep -i vga
```

getting info about USB controllers and about devices connected
```bash
lsusb
lsusb -v
```

getting info about hard disks
```bash
lshw -short -C disk
fdisk -l
fdisk -l /dev/sda
lsblk -p
hdparm -i /dev/sda
hdparm -I /dev/sda

# benchmarking disk read performance
hdparm -tT --direct /dev/sda
```

getting info about WiFi cards and networks
```bash
lshw -C network
iw list | less
lspci | grep -i wireless
iwconfig
iwlist wlo1 scan
iw dev | grep -Po '^\sInterface\s\K.*$'
```

Getting hardware information from the /proc virtual fs
```bash
cat /proc/cpuinfo
cat /proc/partitions
cat /proc/meminfo
cat /proc/version #print Information on running kernel
uname -r    # => kernel version
uname -a    # => print all information
```
    
getting sensors information
```bash
acpi -bi    # battery information
acpi -V
sensors
```

Printing the primary architecture of the machine
```bash
dpkg --print-architecture    # => Example: amd64
uname -m                     # => Example: x86_64
```
