## Finding Files (locate, which, whereis)

`locate` searches in it's own databank. Therefore it is possible that a newly created file can not be found. In this case use `find.

```bash
# updating the locate db
sudo updatedb

# displaying statistics
locate -S

# finding file by name
locate filename  # => filename is expanded to *filename*
locate -i filename  # => the filename is case insensitive
locate -b '\filename'  # => finding by exact name
locate xubuntu-development.png  # => /usr/share/xfce4/backdrops/xubuntu-development.png

# finding using the basename
locate -b filename

# finding using regular expressions
locate -r 'regex'

# checking that the file exists
locate -e filename

# showing command path
which command
which -a command
which ls      # => /usr/bin/ls
which -a ls   # => /usr/bin/ls /bin/ls
which wget    # => /usr/bin/wget

whereis echo  # => echo: /bin/echo /usr/share/man/man1/echo.1.gz
```