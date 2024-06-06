## SCP

On Unix-like operating systems, the scp command copies files over a secure, encrypted network connection.  
scp stands for "secure copy." It is similar to the standard Unix command `cp` but it operates over a secure network connection.  
You can also use `rsync`.  
On Windows just use WinSCP or FileZilla  
```bash
ssh
    -P  Specifies the remote host ssh port.
    -p  Preserves files modification and access times.
    -q  Use this option if you want to suppress the progress meter and non-error messages.
    -C  This option forces scp to compresses the data as it is sent to the destination machine.
    -r  This option tells scp to copy directories recursively.
    -i  Specifies the SSH private key for authentication with the remote host

# Copy the file 'test.txt' to a remote PC
scp test.txt 192.168.0.14:~/Desktop/test.txt

# Copy the directory 'Directory' the home directory of a remote PC
scp -r /home/user/Directory 192.168.0.14:

# Specify a Port
scp -P 22 test.txt user@192.168.0.14:~/test.txt

# Get a file from a remote server
scp remote_username@10.10.0.2:/remote/file.txt /local/directory

# Copy a File Between Two Remote Systems
scp user1@host1.com:/files/file.txt user2@host2.com:/files

# To route the traffic through the machine on which the command is issued, use the -3 option:
scp -3 user1@host1.com:/files/file.txt user2@host2.com:/files

# Using a specific SSH private key for authentication with the remote host:
scp -i ~/.ssh/private_key path/to/local_file remote_host:path/to/remote_file
```
