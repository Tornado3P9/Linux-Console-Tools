# Difference between ls and du command output:

The du (disk usage) command and the ls command report file size differently because they  
measure different things:

- **`du -h filename`** reports the amount of disk space used by the file, rounded up to the nearest  
allocation unit, which is the smallest amount of disk space that can be allocated to a file  
by the filesystem. This means that even if a file contains only a few bytes, it will still  
occupy at least one full allocation unit on the disk, which could be several kilobytes or  
more, depending on the filesystem configuration.

- **`ls -lh filename`**, on the other hand, reports the actual size of the file's contents in bytes,
regardless of how much space it is actually taking up on the disk.

The du command often shows a larger size because it includes the overhead of the filesystem
(like the space taken up by the inode and any indirect blocks) and rounds up to the nearest
allocation unit. The ls command shows the exact size of the file's data.

A file system can appear full even if the sum of the sizes of the files doesn't seem to
account for all the space due to inode exhaustion or due to reserved space for the root user.

**Inodes:** Every file and directory in a Unix-like file system has an inode, which is a data
structure that stores metadata about the file (but not the file name or the actual data). Each
file system has a finite number of inodes, which is determined when the file system is created.
If you have a very large number of small files, you can run out of inodes while still having
free space on the disk. You can check inode usage with the **`df -i`** command.

**Reserved Space:** By default, many Linux file systems reserve a percentage of the total space for
the root user (typically 5%). This reserved space is not available to regular users, so a disk
can appear full to a regular user while still having free space. This is to ensure that the
root user can still log in and perform maintenance on a system that is otherwise full.

To check for inode usage, you can use the command:
```bash
df -i
```

To check for disk usage including reserved space, you can use:
```bash
df -h
```

To see the reserved blocks for the root user, you can use the **`tune2fs`** command (for ext2/3/4 file systems):

```bash
sudo tune2fs -l /dev/sdXY | grep 'Reserved block count'
```

Replace **`/dev/sdXY`** with the actual device name of your file system.
