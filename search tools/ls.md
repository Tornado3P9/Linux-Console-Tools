## ls (list file or directory)

```bash
ls -1v
-l  # Auflistung
-A  # show everything, except for "." or ".."
-a  # show everything
-h  # human readable format
-1  # One file per line
-X  # Sorted by extension
-t  # Ordered by time
-S  # Ordered by size
-r  # reverse order
-v  # sorted by (version) numbers within text
-F  # show file type by appending indicator (one of */=>@|) to entries, also try 'file /run/*' to display some file types
--full-time  # displays full time stamp
-d  # about the Directory
-i  # inode number
-R  # list subdirectories recursively (ls -lR => aehnlicher Effekt, wie bei 'tree')
-I  # Ignore some files (ls -I "*.txt")

# This will give you a long format listing (needed to actually see the file size: K, M, G, KB, MB, GB) and round file sizes up to the nearest MiB
ls -l --block-size=M filename
# If you want MB (10^6 bytes) rather than MiB (2^20 bytes) units, use --block-size=MB instead.
ls -l --block-size=MB filename
# --block-size=M cause a M suffix to be displayed next to the size, and you can use --block-size=1M to omit it
ls -l --block-size=1M filename

# If you simply want file sizes in "reasonable" units, rather than specifically megabytes,
# then you can use -lh to get a long format listing and human readable file size presentation
ls -lh filename

# To get the newest file or directory, use this command:
ls -t | head -1

# To get the oldest file or directory, use this command:
ls -t | tail -1

# Further examples:
ls -a
dir

# This will give you top 3 lines (2 files and the total).
ls -l -t | head -3

# This will just give you the first 2 lines of files, skipping the size line
# tail strips the first line, then head outputs the next 2 lines.
ls -l -t | tail -n +2 | head -2

# See the permissions and other information about the /etc directory:
ls -ld /etc
#->  drwxr-xr-x 154 root root 12288 Sep 12 19:24 /etc

# Selection examples using sed, just for variety:
ls -l | sed -n 2p

# Using this alternative, which looks more efficient since it stops reading the input when the required line is printed, may generate a SIGPIPE in the feeding process, which may in turn generate an unwanted error message:
ls -l | sed -n -e '2{p;q}'
# I've seen that often enough that I usually use the first (which is easier to type, anyway), though ls is not a command that complains when it gets SIGPIPE.

# For a range of lines:
ls -l | sed -n 2,4p

# For several ranges of lines:
ls -l | sed -n -e 2,4p -e 20,30p
ls -l | sed -n -e '2,4p;20,30p'
```
