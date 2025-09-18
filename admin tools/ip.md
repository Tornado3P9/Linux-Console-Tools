# IP information/confguration tools

## Public
```bash
curl ifconfig.me
curl zx2c4.com/ip
curl icanhazip.com
```

## Getting info about the network interfaces (ifconfig, ip, route, nmap)
```bash
# displaying information about enabled interfaces
ifconfig

# displaying information about all interfaces (enabled and disabled)
ifconfig -a
ip address show
ip addr show
ip a s
ip a

nmcli -p device show
hostname -I

# displaying brief/short info
ip -brief address
ip -br a

# displaying info about a specific interface
ifconfig enp0s3
ip addr show dev enp0s3

# showing only IPv4 info
ip -4 address

# showing only IPv6 info
ip -6 address

# displaying L2 info (including the MAC address)
ip link show
ip link show dev enp0s3

# displaying the default gateway
route 
route -n    # numerical addresses
ip route show
ip route list default

# displaying the DNS servers
systemd-resolve --status

# scanning local network
nmap 192.168.0.*

# scanning specific subnets range
nmap 192.168.0.1-30
```

## Setting the network interfaces (ifconfig, ip, route)
```bash
# disabling an interface
ifconfig enp0s3 down
ip link set enp0s3 down
    
# activating an interface
ifconfig enp0s3 up
ip link set enp0s3 up
    
# checking its status
ifconfig -a
ip link show dev enp0s3
    
# setting an ip address on an interface
ifconfig enp0s3 192.168.0.222/24 up
ip address del 192.168.0.111/24 dev enp0s3
ip address add 192.168.0.112/24 dev enp0s3
    
# setting a secondary ip address on sub-interface
ifconfig enp0s3:1 10.0.0.1/24
    
# deleting and setting a new default gateway
route del default gw 192.168.0.1
route add default gw 192.168.0.2
    
# deleting and setting a new default gateway
ip route del default
ip route add default via 192.168.0.1 	
    
# changing the MAC address
ifconfig enp0s3 down
ifconfig enp0s3 hw ether 08:00:27:51:05:a1
ifconfig enp0s3 up
    
# changing the MAC address
ip link set dev enp0s3 address 08:00:27:51:05:a3


# https://netplan.io/examples/
# https://linuxize.com/post/how-to-configure-static-ip-address-on-ubuntu-20-04/
##########################
## Network Static configuration using Netplan (Ubuntu)
##########################
    
# 1. Stop and disable the Network Manager
    
sudo systemctl stop NetworkManager
sudo systemctl disable NetworkManager
sudo systemctl status NetworkManager
sudo systemctl is-enabled NetworkManager
    
# 2. Create a YAML file in /etc/netplan
    
network:
    version: 2
    renderer: networkd
    ethernets:
    enp0s3:
        dhcp4: false
        addresses:
        - 192.168.0.20/24
        gateway4: "192.168.0.1"
        nameservers:
        addresses:
            - "8.8.8.8"
            - "8.8.4.4"
    
# 3. Apply the new config
sudo netplan apply
    
# 4. Check the configuration
ifconfig
route -a
```


## Abhör-/AnalyseTool
```bash
# ngrep 'USER|PASS' src host 192.168.0.20 and tcp port 21 
-> Sucht im Datenstrom nach "USER" oder "PASS". Untersucht werden alle Pakete, die vom Host 192.168.0.20 kommen und Quell- oder Zielport 21 (FTP) besitzen, womit im Handumdrehen Klartextpasswörter für FTP ermittelt werden können. Damit wirklich nur FTP-Verbindungen untersucht werden, ist es besser hier "and src tcp port 21" zu schreiben. 

# tcpdump
-> Dient der Analyse von IP-Paketen, um Fehler oder ungewollte Netzwerkzugriffe zu finden. 

# arp-scan
The easiest way to scan the network you are in is to run any of the following commands
(they all do the same thing):
sudo arp-scan -l                         #Scans the local network
sudo arp-scan 192.168.1.0/24             #Scans 192.168.1.0 255.255.255.0
sudo arp-scan 192.168.1.1-192.168.1.254  #Scans the obvious rang

# netdiscover (arp-scan)
sudo netdiscover

# nmap
To scan for alive hosts on a network, run any of the following commands
(they all do the same thing):
sudo nmap -sP 192.168.1.0/24             #Scans 192.168.1.0 255.255.255.0
sudo nmap -sP 192.168.1.1-254            #Scans the obvious range
sudo nmap -sn 192.168.1.0/24

# Angry IP Scanner
https://angryip.org/

## GET_IP:
ifconfig
ip a s
ip addr show
ip a
ip addr
## GET_PUBLIC_IP:
curl ifconfig.me
(In Webbrowser: myip.is, ifconfig.me, ..)

# traceroute
ist ein Kommandozeilenwerkzeug, um den Transportweg von IP-Datenpaketen zwischen dem eigenen Rechner
und einer ausgewählten Gegenstelle zu ermitteln. Dabei wird die Antwortzeit der durchlaufenen Router gemessen.
In der Praxis kann das Programm genutzt werden, um einerseits das Routing einer Verbindung anzuzeigen und
um andererseits den Verursacher von Verzögerungen zu identifizieren.
$ traceroute google.com

# mtr
kombiniert die Funktionen von traceroute und ping zu einem Netzwerk-Diagnose-Werkzeug.
Es sendet absichtlich Pakete mit niedriger Gueltigkeitsdauer.
$ mtr google.com

# ss
https://linuxhandbook.com/close-open-ports/
ss -tl   # get listening TCP ports
ss -tul  # get listening TCP and UDP ports
```

## Bash Alias
```bash
alias whatismyip="whatsmyip"
function whatsmyip ()
{
  # Internal IP Lookup.
  echo -n "Internal IP: "
  ifconfig | grep -Eo 'inet (addr:)?([0-9]*\.){3}[0-9]*' | grep -Eo '([0-9]*\.){3}[0-9]*' | grep -v '127.0.0.1'

  # External IP Lookup (ident.me, ifconfig.me)
  echo -n "External IP: "
  curl -s ident.me
  echo ""
}

function ipconfig() {
ip -o -f inet addr show | while read -r line; do
    # Extract interface name, IP address, and CIDR
    iface=$(echo "$line" | awk '{print $2}')
    ip_cidr=$(echo "$line" | awk '{print $4}')
    
    # Split IP and CIDR
    ip=$(echo "$ip_cidr" | cut -d'/' -f1)
    prefix_length=$(echo "$ip_cidr" | cut -d'/' -f2)
    
    # Calculate subnet mask from prefix_length
    subnet_mask=$(awk -v prefix_length="$prefix_length" 'BEGIN {
      for (i=0; i<4; i++) {
          n = (prefix_length >= 8) ? 255 : (256 - 2^(8-prefix_length%8));
          prefix_length -= 8;
          printf "%s%s", n, (i<3 ? "." : "\n");
      }
    }')
    
    # Determine interface status
    ip link show $iface | grep --color=auto -q "state UP" && status="Up" || status="Down"
    
    # Get broadcast address
    broadcast=$(ip -o -f inet addr show $iface | awk '{print $6}')
    
    # Get IPv6 information
    ipv6_info=$(ip -o -f inet6 addr show $iface | awk '{print $4}')
    IFS='/' read -r ipv6_address ipv6_prefix <<< "$ipv6_info"
    
    # Get gateways
    gateway=$(ip route show default 0.0.0.0/0 dev $iface | awk '/default/ {print $3}')
    ipv6_gateway=$(ip -6 route show default dev $iface | awk '/default/ {print $3}')
    
    # Print in a format similar to ipconfig from windows
    echo "==================================================="
    echo "Ethernet adapter $iface:"
    echo ""
    echo "   Status . . . . . . . . . . . : $status"
    echo "   IPv4 Address . . . . . . . . : $ip/$prefix_length"
    echo "   Subnet Mask. . . . . . . . . : $subnet_mask"
    echo "   Broadcast Address. . . . . . : $broadcast"
    echo "   IPv6 Address . . . . . . . . : $ipv6_address"
    echo "   IPv6 Prefix Length . . . . . : $ipv6_prefix"
    echo "   Default Gateway (IPv4) . . . : $gateway"
    echo "   Default Gateway (IPv6) . . . : $ipv6_gateway"
    echo ""
done
echo "==================================================="
}
```
