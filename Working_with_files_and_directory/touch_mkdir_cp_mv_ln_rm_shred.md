# Working with files and directory (touch, mkdir, cp, mv, ln, rm, shred)

```bash
# creating a new file or updating the timestamps if the file already exists
touch filename

# creating a new directory
mkdir dir1

# creating a directory and its parents as well
mkdir -p mydir1/mydir2/mydir3
mkdir -p myrepo/{conf,incoming}

#########################
### The touch command ###
#########################
# Create files and set access/modification times.
# - Access: The last time the file was read.
# - Modify: The last time the file's content was modified.
# - Change: The last time the file's metadata or content was changed.
# More information: https://manned.org/touch.

# Create specific files:
touch path/to/file1 path/to/file2

# Set the file [a]ccess or [m]odification times to the current one and don't create file if it doesn't exist.
touch [-c|--no-create] -a|m path/to/file1 path/to/file2

# Set the file [t]ime to a specific value and don't create file if it doesn't exist:
touch [-c|--no-create] -t YYYYMMDDHHMM.SS path/to/file1 path/to/file2

# Set the files' timestamp to the reference file's timestamp, and do not create the file if it does not exist:
touch [-c|--no-create] [-r|--reference] path/to/reference_file path/to/file1 path/to/file2

# Here's how you can display the timestamp data of a file:
stat filename
stat -c "%x %y %z" filename

# For displaying information on the file, you can also use:
file filename
mediainfo filename

######################
### The cp command ###
######################
# https://github.com/jarun/advcpmv

# copying file1 to file2 in the current directory
cp file1 file2

# copying file1 to dir1 as another name (file2)
cp file1 dir1/file2

# copying a file prompting the user if it overwrites the destination
cp -i file1 file2

# preserving the file permissions, group and ownership when copying
cp -p file1 file2

# being verbose
cp -v file1 file2

# recursively copying dir1 to dir2 in the current directory
cp -r dir1 dir2/

# copy more source files and directories to a destination directory
cp -r file1 file2 dir1 dir2 destination_directory/

# copy file1 and file2 from directory1 to directory2
cp directory1/{file1,file2} directory2/

# copy entire directory structures, producing a full copy of a directory and all its contents, including files and other directories (note that the copies aren't exactly the same as the originals)
cp -R docs backup-docs

# use -a (for "archive") instead of -R to also copy the modification time
cp -a docs backup-docs

######################
### The mv command ###
######################
# renaming file1 to file2
mv file1 file2

# moving file1 to dir1
mv file1 dir1/

# moving a file prompting the user if it overwrites the destination file
mv -i file1 dir1/

# preventing a existing file from being overwritten
mv -n file1 dir1/

# moving only if the source file is newer than the destination file or when the destination file is missing
mv -u file1 dir1/

# moving file1 to dir1 as file2
mv file1 dir1/file2

# moving more source files and directories to a destination directory
mv file1 file2 dir1/ dir2/ destination_directory/

# Move all files except one! (If you use bash and have the 'extglob' shell option set which is usually the case):
mv ~/Linux/Old/!(Tux.png) ~/Linux/New/

# Move alle files except these three:
mv ~/Linux/Old/!(Tux.png|Tux1.png|Tux2.png) NewFolder/

# moving everything from dir1 except dir1/src to dir2:
mv -vt dir2/ dir1/!(src)
  # example:
  $ mkdir -pv dir1/{a,b,c,src} dir2
  mkdir: created directory 'dir1'
  mkdir: created directory 'dir1/a'
  mkdir: created directory 'dir1/b'
  mkdir: created directory 'dir1/c'
  mkdir: created directory 'dir1/src'
  mkdir: created directory 'dir2'
  $ ls -l dir1/
  total 16
  drwxrwxr-x 2 dw dw 4096 Apr  7 13:30 a
  drwxrwxr-x 2 dw dw 4096 Apr  7 13:30 b
  drwxrwxr-x 2 dw dw 4096 Apr  7 13:30 c
  drwxrwxr-x 2 dw dw 4096 Apr  7 13:30 src
  $ ls -l dir2/
  total 0
  $ shopt -s extglob
  $ mv -vt dir2/ dir1/!(src)
  'dir1/a' -> 'dir2/a'
  'dir1/b' -> 'dir2/b'
  'dir1/c' -> 'dir2/c'
  $ ls -l dir1/
  total 4
  drwxrwxr-x 2 dw dw 4096 Apr  7 13:30 src
  $ ls -l dir2/
  total 12
  drwxrwxr-x 2 dw dw 4096 Apr  7 13:30 a
  drwxrwxr-x 2 dw dw 4096 Apr  7 13:30 b
  drwxrwxr-x 2 dw dw 4096 Apr  7 13:30 c


######################
### The ln command ###
######################
# https://linuxhandbook.com/ln-command/
# https://itectec.com/unixlinux/bash-create-symlink-overwrite-if-one-exists/
# There are two types of links:
# - Hard link: This points to the memory location of the original file.
#   It does not differ visually from any other binary. But when listed by the 'ls -l' command,
#   instead of a "d" for directory or "-" for files, the first letter will be an "l" for link.
# - Soft link or symbolic link: This is merely a shortcut to the original file.
#   It is usually shown in a different colour.

# creating hard link to a file
ln path/to/target_file path/to/link_file

# creating soft link to a file
ln -s path/to/target_file path/to/link_file
ln -sf path/to/target_file path/to/link_file  # force override of existing link file

# creating soft link to a directory
ln -s path/to/target_directory path/to/link_name

# getting the original file following a chain of links
readlink -f soft_link

# checking whether the bash file inside of /bin/ is the same file like the one inside /usr/bin/
ls -li /bin/bash /usr/bin/bash
# 6029406 -rwxr-xr-x ... /bin/bash
# 6029406 -rwxr-xr-x ... /usr/bin/bash
# -> same Inode number, so obviously a hardlink

# Make use of $(pwd) and ~ and $HOME instead of having to write long paths by hand.

####################################
### The rm, rmdir, shred command ###
####################################
# removing a file
rm file1

# being verbose when removing a file
rm -v file1

# removing a directory
rm -r dir1/

# removing a directory without prompting
rm -rf dir1/

# removing a file and a directory prompting the user for confirmation
rm -ri fil1 dir1/

# Remove directory, provided it is empty. Use `rm -r` to remove non-empty directories
rmdir dir1/

# Remove the target and its parent directories (useful for nested dirs)
rmdir -p dir1/

# secure removal of a file (verbose with 100 rounds of overwriting)
shred -vu -n 100 file1

# wipe the partition sda1
shred -vfz -n 10 /dev/sda1
```
