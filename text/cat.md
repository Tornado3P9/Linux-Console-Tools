## cat

```bash
# The general form for a here document is: 
command << delimiter
document
delimiter


# Following is the input to the command wc -l to count total number of line:
$wc -l << EOF
This is a simple lookup program for good (and bad) restaurants in Cape Town.
EOF
-> 3

# Counting the number of lines in a text file
cat filename | wc -l
-> 42


# You can use here document to print multiple lines using your script:
cat << EOF
This is a simple lookup program for good (and bad) restaurants in Cape Town.
EOF
# This would produce:
This is a simple lookup program for good (and bad) restaurants in Cape Town.


# Creating a shell script file with cat:
cat <<EOF >> filename
#!/bin/bash
echo Hello World!
EOF


# Creating a debian control file
mkdir -p my_package_name/DEBIAN
cat <<EOF > my_package_name/DEBIAN/control
Package: my-package-name
Architecture: all
Maintainer: name
Priority: optional
Version: 0.1
Description: Some description
EOF


# cat && chmod action in one single line
cat > /etc/wireguard/wg0.conf <<'EOF' && chmod 600 /etc/wireguard/wg0.conf
[Interface]
Address = 10.0.0.2/24
#ListenPort = 52002
PrivateKey = <client_private_key>
DNS = 1.1.1.1, 1.0.0.1
# PostUp = iptables -A INPUT -p tcp --dport 51001 -j ACCEPT; iptables -A INPUT -s 10.0.0.0/24 -j DROP
# PostDown = iptables -D INPUT -p tcp --dport 51001 -j ACCEPT; iptables -D INPUT -s 10.0.0.0/24 -j DROP

[Peer]
PublicKey = <server_public_key>
PresharedKey = <preshared_key>
#AllowedIPs = 10.0.0.1/32, 10.0.0.3/32
AllowedIPs = 0.0.0.0/0
Endpoint = <server_public_ip_or_fqdn>:52001
PersistentKeepalive = 25
EOF
```
