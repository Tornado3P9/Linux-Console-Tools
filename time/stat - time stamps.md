### show the atime, mtime, ctime = Access, Modify, Change
```bash
# displaying atime
ls -lu
 
# displaying mtime
ls -l
ls -lt
 
# displaying ctime
ls -lc
 
# displaying all timestamps
stat file.txt
 
# displaying the full timestamp
ls -l --full-time /etc/
 
# creating an empty file if it does not exist, update the timestamps if the file exists
touch file.txt
 
# changing only the access time to current time
touch -a file
 
# changing only the modification time to current time
touch -m file
 
# changing the modification time to a specific date and time
touch -m -t 201812301530.45 a.txt
 
# changing both atime and mtime to a specific date and time
touch -d "2010-10-31 15:45:30" a.txt
 
# changing the timestamp of a.txt to those of b.txt
touch a.txt -r b.txt
 
# displaying the date and time
date
 
# showing this month's calendar
cal
 
# showing the calendar of a specific year
cal 2021
 
# showing the calendar of a specific month and year
cal 7 2021
 
# showing the calendar of previous, current and next month
cal -3
 
# setting the date and time
date --set="2 OCT 2020 18:00:00"
 
# displaying the modification time and sorting the output by name.
ls -l
 
# displaying the output sorted by modification time, newest files first
ls -lt
 
# displaying and sorting by atime
ls -ltu
 
# reversing the sorting order
ls -ltu --reverse
```


### Examples:
```bash
stat file.txt

  File: file.txt
  Size: 72        	Blocks: 8          IO Block: 4096   regular file
Device: 805h/2053d	Inode: 11273836    Links: 1
Access: (0664/-rw-rw-r--)  Uid: ( 1000/    username)   Gid: ( 1000/    username)
Access: 2021-09-16 21:59:06.339754027 +0200
Modify: 2021-09-16 22:00:29.032387709 +0200
Change: 2021-09-16 22:00:29.032387709 +0200
 Birth: -



# make a change to the modify-time-stamp:

touch -m -t 201812301530.45 file.txt
stat file.txt

  File: file.txt
  Size: 72        	Blocks: 8          IO Block: 4096   regular file
Device: 805h/2053d	Inode: 11273836    Links: 1
Access: (0664/-rw-rw-r--)  Uid: ( 1000/    username)   Gid: ( 1000/    username)
Access: 2021-09-16 21:59:06.339754027 +0200
Modify: 2018-12-30 15:30:45.000000000 +0200
Change: 2021-09-16 22:00:29.032387709 +0200
 Birth: -



# make a change to atime and mtime:

touch -d "2010-10-31 15:45:30" file.txt
stat file.txt

  File: file.txt
  Size: 72        	Blocks: 8          IO Block: 4096   regular file
Device: 805h/2053d	Inode: 11273836    Links: 1
Access: (0664/-rw-rw-r--)  Uid: ( 1000/    username)   Gid: ( 1000/    username)
Access: 2010-10-31 15:45:30.000000000 +0200
Modify: 2010-10-31 15:45:30.000000000 +0200
Change: 2021-09-16 22:01:10.022754457 +0200
 Birth: -



# copy time from another file:

touch file.txt -r anotherFile.txt
stat file.txt

  File: file.txt
  Size: 72        	Blocks: 8          IO Block: 4096   regular file
Device: 805h/2053d	Inode: 11273836    Links: 1
Access: (0664/-rw-rw-r--)  Uid: ( 1000/    username)   Gid: ( 1000/    username)
Access: 2010-10-10 10:10:10.000000000 +0200
Modify: 2010-10-10 10:10:10.000000000 +0200
Change: 2021-09-16 22:01:15.345346773 +0200
 Birth: -
```

