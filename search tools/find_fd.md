## find

https://manned.org/find

```bash
# Options:
 -type f, d, l, s, p
 -name filename
 -iname filename # => case-insensitive
 -size n, +n, -n
 -perm permissions
 -links n, +n, -n
 -atime n, -mtime n, ctime n
 -user owner
 -group group_owner
```

Examples
```bash
# Look for occurrences of a string in a directory
find /usr/share/doc -name "copyright"

# Find files by extension:
find / -name '*.ext'
find . -type f -name "*.log"

# Find files matching multiple path/name patterns:
find / -path '**/path/**/*.ext' -or -name '*pattern*'

# Find directories matching a given name, in case-insensitive mode:
find / -type d -iname '*lib*'

# Find files matching a given pattern, excluding specific paths:
find / -name '*.py' -not -path '*/site-packages/*'

# Find files matching a given size range:
find / -size +500k -size -10M

# Run a command for each file (use `{}` within the command to access the filename):
find / -name '*.ext' -exec wc -l {} \;

# Find files modified in the last 7 days and delete them:
find / -daystart -mtime -7 -delete

# Find empty (0 byte) files and delete them:
find / -type f -empty -delete

# Find all files in ~ bigger than 1 MB
find ~ -type f -size +1M

# Delete all files except .tar archives
find . -type f ! -name '*.tar' -exec rm -r {} +
```

find most recently modified files
```bash
# help me find where I left off! (sort by time, one item per row)
ls -t -1

# files within the last 24 hours (1 day)
find . -mtime -1

# files within the last 3 days
find . -mtime -3

# within last hour
find . -mmin +60

# within last 12 hours
find . -mmin +720
```

deep listing the most recently modified files in a directory
```bash
# This command will provide you the 10 most recently modified files, excluding any hidden directories that start with a period.
# The ‘-not -path’ argument is to exclude special directories that start with a period (e.g. .git).
# The “%T@” in the printf makes the first column a timestamp that allows for machine sorting, but doesn’t help the human-readable output, so we cut it before display.
# The cut command syntax for specifying a delimeter -d with a special character is to use the dollar sign: cut -d$'\t' -f2- 
find . -type f -not -path '*/[@.]*' -printf "\n%T@\t%AD %AT %p" | sort -r | cut -d$'\t' -f2- | head -n10
```

## fd

An alternative to `find`.  
Aims to be faster and easier to use than `find`.  
More information: https://github.com/sharkdp/fd  
                  https://youtu.be/f0N_4SgCoMY

```bash
# Recursively find files matching the given pattern in the current directory:
fd pattern

# Find files that begin with "foo":
fd '^foo'

# Find files with a specific extension:
fd --extension txt

# Find files in a specific directory:
fd pattern path/to/directory

# Include ignored and hidden files in the search:
fd --hidden --no-ignore pattern

# Execute a command on each search result returned:
fd pattern --exec command
find . -type f -exec md5sum {} + > checksums.md5
```

```bash
sudo apt install fd-find
fdfind --version
echo "alias fd=fdfind" >> ~/.bash_aliases && source ~/.bashrc
```
