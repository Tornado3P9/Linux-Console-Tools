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
/etc/shadow       # => users' passwords
/etc/group        # => groups
/etc/pam.d/passwd # => PAM configuration for passwd

getent group      # => does the same like "cat /etc/group"
getent passwd     # => does the same like "cat /etc/passwd"


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
# -g => specify the primary group (must exist)
# -e => specify the expiration date
# Exemple:
useradd -m -d /home/john -c "Python Developer" -s /bin/bash -G sudo,adm,mail john
useradd -e 2021-01-01 benjamin

# See the expiration date of user benjamin
sudo chage -l benjamin

# See default behavior of useradd
less /etc/default/useradd

# display last 10 lines/users in the passwd file and their settings, groups, .. (one user per line)
tail /etc/passwd

# changing a user account
usermod [OPTIONS] username           # => uses the same options as useradd
usermod -aG developers,managers john # => adding the user to two secondary groups

# remove a user account (Issuing this command only deletes the user’s account. Their files and home directory are not be deleted.)
userdel username

# removing the user, their home folder, and their files
userdel -r username

# creating admin users
# add the user to sudo group in Ubuntu and wheel group in CentOS
usermod -aG sudo john


###############################################
## Full-Example creating a sudo user (admin): #
###############################################
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
