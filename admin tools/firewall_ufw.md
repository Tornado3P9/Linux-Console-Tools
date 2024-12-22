## ufw (Uncomplicated Firewall)

https://help.ubuntu.com/community/UFW  
https://www.configserverfirewall.com/ufw-ubuntu-firewall/ufw-delete-rule/  
https://www.digitalocean.com/community/tutorials/ufw-essentials-common-firewall-rules-and-commands  
https://www.cyberciti.biz/faq/ufw-allow-incoming-ssh-connections-from-a-specific-ip-address-subnet-on-ubuntu-debian/  
https://youtu.be/kgdoVeyoO2E Fail2ban Tutorial | How to Secure Your Server - Linode  
https://youtu.be/eeaFoZlSq6I Hardening Access to Your Server | Linux Security Tutorial - Linode  
https://linuxhandbook.com/ufw-logs/  

```bash
ufw --help

# show open ports
netstat -tupan

systemctl status ufw
systemctl status iptables

sudo ufw status
sudo ufw status verbose
sudo ufw status numbered
sudo ufw show added

sudo ufw allow ssh     # sudo ufw allow 22/tcp
sudo ufw allow 8086/tcp

# Allow SSH connections from a specific IP address:
sudo ufw allow from 123.123.123.123 to any port 22 proto tcp
# Allow FTP connections:
sudo ufw allow from 123.123.123.123 to any port 21 proto tcp

sudo ufw limit ssh

sudo ufw delete ssh
sudo ufw status numbered
sudo ufw delete 2

# Delete above SSH rule from a specific IP address:
sudo ufw delete allow from 123.123.123.123 to any port 22 proto tcp

sudo ufw enable
sudo ufw disable

sudo ufw reset
```

## iptables

Program that allows configuration of tables, chains and rules provided by the Linux kernel firewall.  
More information: https://www.netfilter.org/projects/iptables/.  

```bash
# View chains, rules, and packet/byte counters for the filter table:
sudo iptables -vnL

# Set chain policy rule:
sudo iptables -P chain rule

# Append rule to chain policy for IP:
sudo iptables -A chain -s ip -j rule

# Append rule to chain policy for IP considering protocol and port:
sudo iptables -A chain -s ip -p protocol --dport port -j rule

# Append iptables rule to drop all incoming ssh traffic:
sudo iptables -A INPUT -p tcp --dport ssh -j DROP

# Add a NAT rule to translate all traffic from the `192.168.0.0/24` subnet to the host's public IP:
sudo iptables -t nat -A POSTROUTING -s 192.168.0.0/24 -j MASQUERADE

# Delete chain rule:
sudo iptables -D chain rule_line_number

# Save iptables configuration of a given table to a file:
sudo iptables-save -t tablename > path/to/iptables_file

# Restore iptables configuration from a file:
sudo iptables-restore < path/to/iptables_file

# Optionally: displaying iptables information the easy way by creating aliases for the most important commands
alias iptlist='sudo iptables -L -n -v --line-numbers'           #this will display all lines of your current iptables
alias iptlistin='sudo iptables -L INPUT -n -v --line-numbers'   #this will display all your INCOMING rules in iptables
alias iptlistout='sudo iptables -L OUTPUT -n -v --line-numbers' #this will display all your OUTGOING rules in iptables
```

## Firewall Configuration Example

```bash
apt install -y ufw fail2ban
ufw default deny incoming
ufw default allow outgoing
ufw allow from 10.0.0.0/8 to any port 22 proto tcp
ufw allow from 172.16.0.0/12 to any port 22 proto tcp
ufw allow from 192.168.0.0/16 to any port 22 proto tcp
ufw allow from 169.254.0.0/16 to any port 22 proto tcp
ufw allow from fc00::/7 to any port 22 proto tcp
ufw allow from fe80::/10 to any port 22 proto tcp
ufw allow from ff00::/8 to any port 22 proto tcp
ufw allow 80/tcp
ufw allow 443/tcp
yes | ufw enable
```
This **`yes`** command outputs a continuous stream of "y" characters followed by a newline. It's often used to automatically answer "yes" to prompts in scripts or commands.
When you run **`ufw enable`**, it typically asks for confirmation. By using **`yes |`**, you automatically confirm the prompt, allowing the command to proceed without manual intervention.

Note: Changing the default SSH port from 22 to another port like 2222 was a common practice to reduce the risk of automated attacks and port scanning.
However, today this is considered obsolete because it is security through obscurity which doesn't provide substantial protection against attackers.
