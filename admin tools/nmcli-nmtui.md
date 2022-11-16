https://developer-old.gnome.org/NetworkManager/stable/nmcli-examples.html

https://access.redhat.com/documentation/en-us/red_hat_enterprise_linux/7/html/networking_guide/sec-configuring_ip_networking_with_nmcli

https://www.rene-pickhardt.de/index.html%3Fp=1955.html Cleaning up my network connections on ubuntu linux using the network manager nmcli


Disable Network:
```bash
# Disable networking completely
nmcli networking off

# Just for WiFi
nmcli radio wifi off
```

Enable Network:
```bash
# Enable networking completely
nmcli networking on

# Just for WiFi
nmcli radio wifi on
```

Show Help:
```bash
nmcli radio help   
nmcli radio wifi help
```
