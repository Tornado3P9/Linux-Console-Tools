# Ownership (chown) and Permissions (chmod)

https://wiki.ubuntuusers.de/chmod/
https://wiki.ubuntuusers.de/chown/
https://manpages.ubuntu.com/manpages/trusty/man1/chown.1.html
https://linuxhint.com/give-user-folder-permission-linux/

File ownership and permissions are crucial in a multi-user system like Linux for security and data integrity. Each file and directory has an associated owner and a group, and permissions that determine who can read, write, or execute the
file.

- **Ownership (chown)**: Determines which user and group own the file. This affects who can change permissions and modify the file.
- **Permissions (chmod)**: Define what actions specific users and groups can perform on the file (read, write, execute).

There are two separate commands because ownership and permissions are distinct properties:

- **`chown`** changes the owner and group of a file, which is typically an administrative action.
- **`chmod`** changes the permissions, which can be done by the owner to control access.

Separating these commands provides fine-grained control over files and directories, allowing administrators to manage access rights and ownership securely and flexibly.

### Permission Execute(x), Write(w), Read(r):
```bash
0 	None
1 	x
2 	w
3 	w+x
4 	r
5 	r+x
6 	r+w
7 	r+w+x

sudo chmod -R 700 /media/disk
sudo chmod 764 filename
```

### Examples:
```bash
644 	# The owner can read and write. Everyone else can only read. (6 = 4 + 2)
744 	# The owner can read, write and execute. Everyone else can only read. (7 = 4 + 2 + 1)
660 	# Owner and Group can read and write. The others don't have got any permissions.
4755 	# Everyone can read and execute. The Owner can write also. Additinally the SetUID-Bit is set.
```

The command **`ls -lh`** returns lines with **`xrw-rw-r--`** in them, which is the same as **`764`**.

### Make Program executable for everyone:
```bash
sudo chmod +x program # everyone can execute the program
sudo chmod -x program # no one can execute the program
```

### Set directory permissions to the standard user (id 1000):
```bash
sudo chown -R 1000:1000 /media/disk
sudo chown $USER:$USER /media/disk
```

### Set directory permissions to root and also make the files readable by administrator only:
```bash
sudo chown -R root:root ~/directory/
sudo chmod -R og-rwx ~/directory/
```

### Take rights away for everyone else besides root for everything that you do in this root session...always a good idea when handling system configurations
```bash
sudo -i && umask 077
   #That's as if you would do 'chmod 600 filename' for every file that you worked on and after that 'chown root:root filename' for the owner and the group...
   #After 'exit' out from the root session, the umask 077 will return again to the standard umask (usually 022)
```

### Set specific and general execution permissions:

- **`chmod u+x`**: This command adds execute permission (**`x`**) to the user (**`u`**) who owns the file, without changing the permissions for the group (**`g`**) and others (**`o`**).
- **`chmod a+x`**: This command adds execute permission (**`x`**) to all categories: user (**`u`**), group (**`g`**), and others (**`o`**). It ensures that everyone has the execute permission on the file.

Here's a quick example to illustrate the difference:

- Before any **`chmod`** operation, let's say the file permissions are **`-rw-r--r--`**.
- After **`chmod u+x`**, the permissions would change to **`-rwxr--r--`**.
- After **`chmod a+x`**, the permissions would change to **`-rwxr-xr-x`**.
