# Wireguard

[WireGuard Official Website](https://www.wireguard.com/)  
[Linode Wireguard Setup](https://www.linode.com/docs/guides/set-up-wireguard-vpn-on-ubuntu/)  
[Install Wireguard on Linux (Server/Client) - DJ Ware](https://youtu.be/jAPDz3riG54)  
[Wireguard Configuration - GitLab](https://gitlab.com/djware27/wireguard-configuration)  
[Wireguard Setup](https://www.smarthomebeginner.com/linux-wireguard-vpn-server-setup/)  

[krair/cloud-tools](https://github.com/krair/cloud-tools)  
[Nyr/wireguard-install](https://github.com/Nyr/wireguard-install)  
[psyhomb/wireguard-tools](https://github.com/psyhomb/wireguard-tools)  
[ngoduykhanh/wireguard-ui](https://github.com/ngoduykhanh/wireguard-ui)  
[Wireguard installation and configuration](https://gitlab.com/-/snippets/1897102)  
[pprometey/wireguard_aws](https://github.com/pprometey/wireguard_aws)  

[Misborn GitLab](https://gitlab.com/cyber5k/mistborn)  
[Mistborn Youtube](https://youtu.be/b6XeWiiOWeA)  

[Tailscale](https://tailscale.com/)  
[Tailscale Documentation](https://tailscale.com/blog/how-tailscale-works/)  

Dynamic debugging over kernel interface  
Debugfs under `/sys/kernel/debug`  
Dynamicly activate via:  
```
echo 'module wireguard +p' | sudo tee /sys/kernel/debug/dynamic_debug/control
```
then in `dmesg/journal`  

