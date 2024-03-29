## Simple Internet Speed Test

```bash
#Speedtest_consoletool from Netflix
sudo snap install fast
fast

#Speedtest from speedtest.net
sudo apt install speedtest-cli
speedtest-cli

#Testing Router, through which packets are being sent
sudo apt install traceroute
traceroute google.com
#
sudo apt install mtr #combines traceroute and ping
mtr google.com

#ping
ping google.com
```


## How to Test Network Throughput Between Linux Servers

https://www.techtarget.com/searchnetworking/tip/How-to-use-iPerf-to-measure-throughput  
https://www.tecmint.com/test-network-throughput-in-linux/  

```bash
sudo apt install iperf3


# Server A starts listening (usually at port 5201, but if that is taken just specify another: iperf3 -s -p 3000)
iperf3 -s

# Optionally, you can run the server as a daemon, using the -D flag and write server messages to a log file
iperf3 -s -D > iperf3log

# Server B (client) starts sending
iperf3 -c 10.10.10.1 -p 3000

# To modify the previous command to run upstream and downstream throughput simultaneously (bidirectional)
iperf3 -c 10.10.10.1 -p 3000 -bidir

# Print out version number
iperf3 -v
```
