# LVMs

```bash
# Go root
sudo -i

# Rescan all SCSI hosts to detect newly added disks
for i in /sys/class/scsi_host/host*; do
  echo "- - -" > "$i/scan"
done
# or
for i in $(ls /sys/class/scsi_host/); do echo "- - -" > /sys/class/scsi_host/$i/scan; done

# Create a new physical volume
pvcreate /dev/sdX  # Replace /dev/sdX with the actual device name

# Extend the volume group with the new physical volume
vgextend myVolumeGroup /dev/sdX

# Extend the logical volume to use all free space
lvextend -rl +100%FREE /dev/mapper/myVolumeGroup-myVolume  # optionally add "/dev/sdX"

# Create a new logical volume from scratch
lvcreate -n myVolumee -l 100%FREE myVolumeGroup

#----------------------------------------------

# Display information about physical, volume, and logical volumes
pvdisplay
vgdisplay
lvdisplay

# Scan for physical, volume, and logical volumes
pvscan
vgscan
lvscan

# Display concise information about volumes
pvs
vgs
lvs

#----------------------------------------------

# Format the logical volumes with ext4 filesystem
mkfs.ext4 /dev/myVolumeGroup/myVolume
mkfs.ext4 /dev/myVolumeGroup/myVolumee

# Create mount points
mkdir -p /mnt/mymountpoint/{a,b}

# Mount the logical volumes
mount /dev/myVolumeGroup/myVolume /mnt/mymountpoint/a
mount /dev/myVolumeGroup/myVolumee /mnt/mymountpoint/b

# Verify mounts
mount | grep mymountpoint

# List device details (notice that it both points to the same "file")
ls -al /dev/myVolumeGroup/myVolume
ls -al /dev/mapper/myVolumeGroup-myVolume

# Find the UUIDs of the logical volumes
blkid /dev/myVolumeGroup/myVolume
blkid /dev/myVolumeGroup/myVolumee

# Edit /etc/fstab to make mounts permanent
echo "UUID=<UUID_of_myVolume> /mnt/mymountpoint/a ext4 defaults 0 2" | sudo tee -a /etc/fstab
echo "UUID=<UUID_of_myVolumee> /mnt/mymountpoint/b ext4 defaults 0 2" | sudo tee -a /etc/fstab

# Test the fstab configuration
umount /mnt/mymountpoint/a
umount /mnt/mymountpoint/b
mount -a  # Mount all filesystems mentioned in /etc/fstab

#----------------------------------------------

# Unmount the logical volumes
umount /mnt/mymountpoint/a
umount /mnt/mymountpoint/b

# Remove the logical volumes
lvremove /dev/myVolumeGroup/myVolume
lvremove /dev/myVolumeGroup/myVolumee

# Remove the volume group
vgremove myVolumeGroup

# Remove the physical volume
pvremove /dev/sdX  # Replace /dev/sdX with the actual device name

# Optionally, remove the mount points
rm -rf /mnt/mymountpoint/{a,b}

# Clean up /etc/fstab entries (search for lines containing the string `mymountpoint` and delete them)
sed -i '/mymountpoint/d' /etc/fstab

```
