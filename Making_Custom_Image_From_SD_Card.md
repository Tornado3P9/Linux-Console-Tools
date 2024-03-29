## Making Custom Pi Image

https://www.linuxtechi.com/how-to-install-cockpit-on-ubuntu-20-04/  
https://opensource.com/article/21/7/custom-raspberry-pi-image  
https://github.com/Drewsif/PiShrink  
https://www.howtoforge.de/anleitung/linux-xz-befehl/  

```bash
# Step 1: Copy the image data to your Hard Drive
dd if=/dev/sdg of=~/MyImage.img bs=32M
#-> dd: failed to open '/dev/sdg': Permission denied
sudo !!
#-> sudo dd if=/dev/sdg of=~/MyImage.img bs=32M
#-> [sudo] password for user: 
#-> 474+1 records in
#-> 474+1 records out
#-> 15931539456 bytes (16 GB, 15 GiB) copied, 720,867 s, 22,1 MB/s
#-> Schreibdauer: Exakt 12 Minuten

mediainfo MyImage.img 
#-> General
#-> Complete name                            : MyImage.img
#-> File size                                : 14.8 GiB


# Step 2: Install the image manipulation script
wget https://raw.githubusercontent.com/Drewsif/PiShrink/master/pishrink.sh
chmod +x pishrink.sh
sudo mv pishrink.sh /usr/local/bin


# Step 3: Reduce Filesize and save logfile by executing script with the -d option
sudo pishrink.sh -d ~/MyImage.img

mediainfo MyImage.img 
#-> General
#-> Complete name                            : MyImage.img
#-> File size                                : 3.30 GiB

# Alternativ noch zippen (oder einfach Komprimierungsoption im pishrink.sh wählen)
xz -k MyImage.img

# (Optionally) list information about the new .xz file
xz -l MyImage.img.xz
#-> Strms  Blocks   Compressed Uncompressed  Ratio  Check   Filename
#->     1       1    736,0 MiB  3.304,0 MiB  0,223  CRC64   MyImage.img.xz
```


## Flashing Custom Pi Image to SD Card

```bash
# extract zipped image
unxz -k MyImage.img.xz

# (optional) checking the image file content
sudo fdisk -l MyImage.img

# checking mounted file systems
lsblk -p

# unmounting sd card
umount /dev/sdc1 && umount /dev/sdc2

# checking after unmounting
lsblk -p

# flashing the image to the sd card
sudo dd if=MyImage.img of=/dev/sdc bs=32M status=progress conv=fsync
```



## Note:
When modifying an existing image you are directly able to make sure that the changes you applied are working.  
`REQUIRED_TOOLS="parted losetup tune2fs md5sum e2fsck resize2fs`  
https://appuals.com/mount-img-files-linux/  
https://wiki.osdev.org/Loopback_Device  
https://www.tecmint.com/parted-command-to-create-resize-rescue-linux-disk-partitions/  
