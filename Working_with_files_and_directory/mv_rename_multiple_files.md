# Renaming multiple files with the `mv` and the `rename` Command:

https://www.howtogeek.com/423214/how-to-use-the-rename-command-on-linux/  
https://linuxize.com/post/how-to-rename-files-in-linux/


The mv command can rename only one file at a time, but it can be used in conjunction with other commands
such as find or inside bash for or while loops to rename multiple files.
The following example shows how to use the Bash for loop to rename all .html files in the current directory
by changing the .html extension to .php

```bash
for f in *.html; do
  mv -- "$f" "${f%.html}.php"
done

for f in "beginning of a file name - "*; do
  mv -- "$f" "${f#beginning of a file name - }"
done
```
- The first line creates a for loop and iterates through a list of all files edging with .html
- The second line applies to each item of the list and moves the file to a new one replacing .html with .php
  The part `${file%.html}` is using the shell parameter expansion to remove the .html part from the filename
- done indicates the end of the loop segment

```bash
# Adding a word at the beginning of a filename:
for file in *.txt; do
  mv "$file" "prefix_$file"
done
```


## Better Way:
```bash
sudo apt install rename

rename --version
rename --help

# Simple example:
rename 's/oldtext/newtext/' *.m4a

# Delete each '#' in all filenames by leaving the changeTo part empty:
rename 's/#//' *.m4a

# You can use the -n option to print names of files to be renamed, without renaming them.
rename -n 's/.html/.php/' \*.html

# Replace spaces in filenames with underscores
rename 'y/ /\_/' \*

# Convert filenames to lowercase
rename 'y/A-Z/a-z/' \*

# Convert filenames to uppercase
rename 'y/a-z/A-Z/' \*

# Remove 'beginning - ' from the beginning of all file names in the current directory:
rename 's/^beginning - //' *

# Remove the first 11 characters from a file name:
rename 's/^.{11}//' *

# Adding a word at the beginning of a filename:
rename 's/^/prefix_/' *.txt
```
