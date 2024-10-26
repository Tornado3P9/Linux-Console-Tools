## Working directly with device files (dd)

```bash
# Creating a large file of size 100GB for testing
# The bs stands for "block size." This tells dd how much data to read and write at a time.
# count=100 tells dd how many blocks of the specified size to copy.
dd if=/dev/zero of=filename bs=1G count=100

# backing up the MBR (the first sector of /dev/sda)
dd if=/dev/sda of=~/mbr.dat bs=512 count=1

# restoring the MBR
dd if=~/mbr.dat of=/dev/sda bs=512 count=1

# cloning a partition (sda1 to sdb2)
dd if=/dev/sda1 of=/dev/sdb2 bs=4M status=progress

# copying the contents of the SD card to our file system
dd if=/dev/sdc of=~/MyImage.img bs=32M

# flashing the new image back to the SD card
dd if=/path/to/image.img of=/dev/sdc bs=32M conv=fsync
# With bs=32M, you specify that the SD card is written in 32-megabyte blocks, conv=fsync forces the process to physically write each block.

# overwriting harddrive "/dev/sda" with zeros ("/dev/zero")
dd if=/dev/zero of=/dev/sda

# (redundant!) overwriting harddrive "/dev/sda" with random numbers ("/dev/urandom")
dd if=/dev/urandom of=/dev/sda

## Creating Bootable Debian 10 USB Stick on Linux
lsblk -p
umount /dev/sdx1
sudo dd bs=4M if=/path/to/debian-10.0.0-amd64-netinst.iso of=/dev/sdx status=progress oflag=sync
```

### Tipps:
`conv=fsync` differs from `oflag=sync`.  
`oflag=sync` effectively syncs after each output block. `conv=fsync` does one sync at the end.  
The end result is the same, but the performance along the way is different.  
`oflag=sync` could be significantly slower. You can mitigate this, by increasing the block size.  
If device-specific caches are large, this will affect the progress reported e.g. by the `status=progress` option.  
If you do not use `oflag=direct`, then large amounts of writes can build up in the system page cache. This build-up will affect the progress you see.  
But also, Linux sometimes responds badly to the build-up, and degrades performance for all devices.  
Instead of `conv=fsync` you could also write `&& sync` at the end of the command.

Creating a file with random data for testing can be done in many ways. Here is another:  
```bash
base64 /dev/urandom | head -c 1000000 > random_text_file.txt
```  
- **base64 /dev/urandom**: Generates a stream of random data encoded in base64.
- **head -c 1000000**: Truncates the stream to the first 1,000,000 characters (which is roughly 1MB).
- **> random_text_file.txt**: Redirects the output to a file named random_text_file.txt.


### Bmaptool
is a generic tool for creating the block map (bmap) for a file and copying files using the block map.  
The idea is that large files, like raw system image files, can be copied or flashed a lot faster and more reliably with bmaptool than with traditional tools, like dd or cp.  
Bmaptool supports 2 commands:  
 1. copy - copy a file to another file using bmap or flash an image to a block device
 2. create - create a bmap for a file
Examples:
```bash
sudo apt install bmap-tools
sudo bmaptool copy debian.img /dev/sdx
```
