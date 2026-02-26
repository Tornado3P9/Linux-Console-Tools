## Account Management

https://www.digitalocean.com/community/tutorials/how-to-create-a-sudo-user-on-ubuntu-quickstart  
https://websiteforstudents.com/how-to-list-all-user-groups-on-ubuntu-18-04-16-04-with-examples/  
https://www.computerhope.com/unix/upasswor.htm  
https://bytexd.com/how-to-create-and-manage-groups-in-linux/  
https://origin.geeksforgeeks.org/useradd-command-in-linux-with-examples/  
https://www.linode.com/docs/guides/linux-users-and-groups/  
https://manned.org/useradd  
https://manned.org/groupadd  

```bash
## IMPORTANT FILES
/etc/passwd       # => users and info: username:x:uid:gid:comment:home_directory:login_shell
/etc/shadow       # => users' passwords (for information: man shadow)
/etc/group        # => groups
/etc/pam.d/passwd # => PAM configuration for passwd

getent group      # => does the same like "cat /etc/group"
getent passwd     # => does the same like "cat /etc/passwd"

visudo            # => Edit the sudoers file (/etc/sudoers) with automatic syntax error check
EDITOR=vim visudo # => Edit the sudoers file using a specific editor
visudo -c         # => Check the sudoers file for errors

/etc/default/useradd  # => Default behavior for useradd


####################
## USER PASSWORDS: #
####################
# changing your password
passwd
# changing another user's password
sudo passwd jeff
# changing the passwords for multiple users (The input text must not contain any spaces.)
printf "username_1:new_password_1\nusername_2:new_password_2" | sudo chpasswd


###################
## USER ACCOUNTS: #
###################
# creating a user account
useradd [OPTIONS] username
# OPTIONS:
# -m => create home directory
# -M => create a user without home directory
# -d directory => specify another home directory
# -c "comment"
# -s shell
# -G => specify the secondary groups (must exist)
# -g => specify the primary group (must exist and by default has the same name as the username)
# -e => specify the expiration date
# -u => specify a user ID

# Exemple:
useradd -m -d /home/john -c "Python Developer" -s /bin/bash -G sudo,adm,mail john
useradd -e 2021-01-01 benjamin
useradd -m -G sudo -s /bin/bash <newuser>

# Expiration date
chage -l benjamin                            # See the expiration date of user benjamin
chage [-M|--maxdays] 10 username             # Enable password expiration in 10 days
chage [-M|--maxdays] -1 username             # Disable password expiration
chage [-E|--expiredate] YYYY-MM-DD username  # Set account expiration date
chage [-d|--lastday] 0 username              # Force user to change password on next log in
chage [-E|--expiredate] -1 username          # Re-enable an account

# User shell
chsh [-l|--list-shells]                   # List available shells
chsh [-s|--shell] path/to/shell           # Set a specific login shell for the current user
chsh [-s|--shell] path/to/shell username  # Set a login shell for a specific user

# display last 10 lines/users in the passwd file and their settings, groups, .. (one user per line)
tail /etc/passwd

# changing a user account
usermod [OPTIONS] username           # => uses the same options as useradd
usermod -aG developers,managers john # => adding the user to two secondary groups

# remove a user account (Issuing this command only deletes the user’s account. Their files and home directory are not be deleted.)
userdel username

# removing the user, their home folder, and their files
userdel [-r|--remove] username

# creating admin users: add the user to `sudo` group in Ubuntu and `wheel` group in CentOS
usermod -aG sudo john
usermod -aG wheel john

# for doing sudo without password prompt, which is nice for ansible:
visudo  # ansible ALL=(ALL) NOPASSWD:ALL

##################
## Install sudo: #
##################
# change to root user
su

# install sudo package
apt update && apt install sudo

# Now either add the user to the sudo group via the perl script:
/sbin/adduser mynormaluser sudo
# Or with the default method:
usermod -aG sudo mynormaluser


###############################################
## Full-Example creating a sudo user (admin): #
###############################################
# Verion A with `adduser` command:
# Log in to your server as the root user.
ssh root@server_ip_address
# Use the adduser command to add a new user to your system. (adduser is a perl script that uses useradd. slightly more userfriendly as it automaticly creates a home directory for the user)
adduser username
# Use the usermod command to add the user to the sudo group.
usermod -aG sudo username
# Test sudo access on new user account
# Use the su command to switch to the new user account.
su - username
# As the new user, verify that you can use sudo by prepending “sudo” to the command that you want to run with superuser privileges.
sudo apt update

# Verion B with standard `useradd` command:
useradd -m -c "important comment like a ticket number" -s /bin/bash admin
passwd admin
usermod -aG sudo admin
su - admin
sudo whoami  # You should be prompted for a password, and the output should be `root` if successful.
grep "^admin" /etc/passwd


##################
## LINUX GROUPS: #
##################
# The primary user’s group is stored in the /etc/passwd file and the
# supplementary groups, if any, are listed in the /etc/group file.

# creating a group
groupadd group_name

# see whether group was added
getent group | grep group_name

# deleting a group
groupdel group_name

# List User Groups using 'groups' command. The first group with same name as the user account name is the primary group.
groups

# To list all the groups a user belongs, add the username to the groups command
groups richard

# List User Groups using the 'id' command. This will show the username (uid), the user’s primary group (gid), and the user’s secondary groups (groups).
id richard

# List Group Membership using the getent command to get all the users who have access to the cdrom group
getent group cdrom

# Listing All Groups
less /etc/group


######################
## Monitoring Users: #
######################
who -H   # => displays logged in users
id       # => displays the current user and its groups
id -u    # => is the EUID (Effective UID is the user you changed to)
id -u -r # => is the UID  (UID is the original user)
whoami   # => displays EUID
     
# listing who’s logged in and what’s their current process.
w
uptime
     
# printing information about the logins and logouts of the users
last
last -u username

# displaying information about the users currently logged on to the machine, in real-time
whowatch
```
