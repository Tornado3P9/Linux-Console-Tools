https://wiki.ubuntuusers.de/chmod/  
https://wiki.ubuntuusers.de/chown/  
https://manpages.ubuntu.com/manpages/trusty/man1/chown.1.html  
https://linuxhint.com/give-user-folder-permission-linux/  

Permission Execute(x), Write(w), Read(r):
```bash
sudo chmod 777 /media/disk
sudo chmod 764 filename

# Version with numbers:
0 	Keine
1 	x
2 	w
3 	w+x
4 	r
5 	r+x
6 	r+w
7 	r+w+x

# Examples:
644 	# The owner can read and write. Everyone else can only read. (6 = 4 + 2)
744 	# The owner can read, write and execute. Everyone else can only read. (7 = 4 + 2 + 1)
660 	# Owner and Group can read and write. The others don't have got any permissions.
4755 	# Everyone can read and execute. The Owner can write also. Additinally the SetUID-Bit is set.

# In Terminal:
ls -lh  # xrw-rw-r-- ......... is the same like 764

# Make Program executable for everyone:
sudo chmod +x program # everyone can execute the program
sudo chmod -x program # no one can execute the program

# Set directory permissions to the standard user (id 1000):
sudo chown -R 1000:1000 /media/disk

# Set directory permissions to root and also make the files readable by administrator only:
sudo chown -R root:root ~/directory/
sudo chown -R og-rwx ~/directory/*

# Take rights away for everyone else besides root for everything that you do in this root session...always a good idea when handling system configurations
sudo -i && umask 077
   #That's as if you would do 'chmod 600 filename' for every file that you worked on and after that 'chown root:root filename' for the owner and the group...
   #After 'exit' out from the root session, the umask 077 will return again to the standard umask (usually 022)
```
