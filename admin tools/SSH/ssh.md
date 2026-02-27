## SSH

- https://www.redhat.com/sysadmin/manage-multiple-ssh-key-pairs
- https://www.tecmint.com/passwordless-ssh-login-for-multiple-remote-servers/
- https://serverpilot.io/docs/how-to-enable-ssh-password-authentication/
- [How to use Multiple SSH Keys | Managing Different SSH Keys on your System - Linode](https://youtu.be/pE3EuiyShoM)
- https://www.linode.com/docs/guides/use-public-key-authentication-with-ssh/
- https://www.linode.com/docs/guides/ssh-key-authentication-how-to-troubleshoot-permission-issues/
- https://www.digitalocean.com/community/tutorials/how-to-harden-openssh-on-ubuntu-20-04

### Installation
https://ubuntu.com/server/docs/service-openssh  
```bash
# Install the OpenSSH client applications on your normal Ubuntu system
sudo apt install openssh-client

# Install the OpenSSH server application, and related support files
sudo apt install openssh-server
```


### Intro
On Windows just use Putty or the SSH client used by WSL or by https://gitforwindows.org/  
```bash
ssh user@hostname
ssh 10.100.73.107
ssh -p 1234 user@10.100.73.107              # using a specific port on the target machine
ssh -v 10.100.73.107                        # verbose = printing more information
ssh -i ~/.ssh/myprivatekey 10.100.73.107    # using a specific key if you got more than one
exit                                        # quit the ssh session
```

https://www.christitus.com/ssh-guide  
https://www.cyberciti.biz/faq/ufw-allow-incoming-ssh-connections-from-a-specific-ip-address-subnet-on-ubuntu-debian/  
https://www.tecmint.com/disable-ssh-root-login-in-linux/  
https://ubuntuforums.org/showthread.php?t=2359172  
```bash
sudo nano /etc/ssh/sshd_config

# Restart SSH service (check syntax with sshd -t)
sudo systemctl reload sshd

# To remove an old/unused ssh-keygen:
ssh-keygen -f "/home/$USER/.ssh/known_hosts" -R "destination-ip-address"

# To locally verify key/password:
ssh-keygen -y -f ~/.ssh/keyfile
```

### Creating a SSH-Configuration where you only use an alias and the configuration knows where to go and which of your keys to use
```bash
nano ~/.ssh/config
```
and write the following lines:
```bash
Host target1
  Hostname 10.100.73.107
  User root
  Port 2222
  IdentityFile ~/.ssh/target1_key

Host superserver
  Hostname super.server.cloud
  IdentityFile ~/.ssh/superserver_key

# my_github_account
Host github.com-my_github_account github account
  HostName github.com
  User git
  IdentityFile ~/.ssh/id_ed25519
```

Save the file and then login to your server by only typing
```bash
ssh target1
ssh superserver
```

### Manually Setup Passwordless SSH Login

SSH-CLIENT  
```bash
ssh-keygen -t rsa -b 4096
# STOP!
# To create a custom named key pair in the folder ~/.ssh, write the complete path:
/home/user/.ssh/id_custom_rsa
-> id_custom_rsa  id_custom_rsa.pub

# Use ssh copy function to copy and additionaly -i to specify which key to copy (password login still needs to be enabled ofcourse)
ssh-copy-id -i ~/.ssh/id_custom_rsa.pub user@ip-address

# Or login via password and manually setup the configuration:
mkdir ~/.ssh && vim ~/.ssh/authorized_keys
chmod 644 ~/.ssh/authorized_keys && chmod 0700 ~/.ssh
```

SSH-SERVER (Destination)  
```bash
# Check whether file has got the new key
cat ~/.ssh/authorized_keys

# Check the file and path permissions
cd ~/.ssh && namei -om $(pwd) && ls -l ~/.ssh/authorized_keys

# Now disable password login on the server
sudo vim /etc/ssh/sshd_config
# and set
"PasswordAuthentication no"

# Restart the ssh client
sudo systemctl restart ssh
# Or 'sudo service ssh restart' for RedHat

# Exit and login again but with the ssh_key, not with password
ssh user@ip-address
```

**Version B:** Generate an ed25519 key with the server hostname instead of the email as a comment and specify the file in which to save the key directly  
```bash
ssh-keygen -t ed25519 -C "home-server-hostname" -f ~/.ssh/home_server_key
```

Re-Enable SSH Password Authentication  
```bash
# To enable SSH password authentication, you must SSH in as root to edit this file:
/etc/ssh/sshd_config

# Then, change the line 'PasswordAuthentication no' to:
PasswordAuthentication yes

# After making that change, restart the SSH service by running the following command as root:
sudo service ssh restart

# Show the configuration settings that sshd will use, including both default settings and those specified in the configuration files (like /etc/ssh/sshd_config):
sudo sshd -T
```

Enable Logging In as root (optional and probably not advisable)  
```bash
sudo -i
nano /etc/ssh/sshd_config # PermitRootLogin yes
sudo service ssh restart
sudo passwd root # set a strong root password!
```

### Setup Passwordless SSH Login for Multiple Remote Servers Using Script
https://www.tecmint.com/passwordless-ssh-login-for-multiple-remote-servers/

`ssh-copy.sh`
```bash
#!/bin/bash
USER_NAME="root"
HOST_FILE="/root/hosts"
ERROR_FILE="/tmp/ssh-copy_error.txt"
PUBLIC_KEY_FILE="$1"

if [ ! -f  $PUBLIC_KEY_FILE ]; then
        echo "File '$PUBLIC_KEY_FILE' not found!"
        exit 1
fi

if [ ! -f $HOST_FILE ]; then
        echo "File '$HOST_FILE' not found!"
        exit 2
fi

for IP in `cat $HOST_FILE`; do
        ssh-copy-id -i $PUBLIC_KEY_FILE $USER_NAME@$IP 2>$ERROR_FILE
        RESULT=$?
        if [ $RESULT -eq 0 ]; then
                echo ""
                echo "Public key successfully copied to $IP"
                echo ""
        else
                echo "$(cat  $ERROR_FILE)"
                echo 
                exit 3
        fi
        echo ""
done

# # The following actions are:
#
# ssh-keygen -t ed25519 -C "server-hostname" -f ~/.ssh/server_key
#
# chmod +x ssh-copy.sh
# ./ssh-copy.sh /root/.ssh/server_key.pub
#
# eval "$(ssh-agent -s)"
# ssh-add  ~/.ssh/server_key
#
# ssh user@ip-address
```
