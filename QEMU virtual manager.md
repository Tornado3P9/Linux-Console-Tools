# QEMU virtual manager

Installation of KVM:
```bash
# Check whether you've enabled virtualization on your computer. It should be above 0
egrep -c '(vmx|svm)' /proc/cpuinfo

# Or check by typing
lscpu | grep Virtualization
# If the output is something like (Virtualization:  AMD-V) or (Virtualization:  VT-x) then it should work.
# Don't forget to also enable this feature in your BIOS!

# Install Necessary Packages
sudo apt install qemu-kvm libvirt-clients libvirt-daemon-system bridge-utils virtinst libvirt-daemon virt-manager -y

# Verify that Libvirtd service is started
sudo systemctl status libvirtd.service

# Start Default Network for Networking
sudo virsh net-start default
sudo virsh net-autostart default

# Check status
sudo virsh net-list --all

# Add User to libvirt to Allow Access to VMs
sudo adduser `id -un` libvirt
sudo adduser `id -un` libvirt-qemu

# Reboot
reboot
```

## Further Tutorials:

https://absprog.com/post/qemu-kvm-ubuntu-24-04  
https://www.christitus.com/vm-setup-in-linux  
https://youtu.be/HOH6YgPkDrE  
https://youtu.be/vyLNpPY-Je0  
https://octetz.com/docs/2020/2020-05-06-linux-hypervisor-setup/  

Qemu/kvm - how to migrate a VM to another computer  
https://youtu.be/0Ny0__uTGfM  

qemu/kvm bridge and NAT networking  
https://youtu.be/DYpaX4BnNlg  

QEmu / KVM snapshots tutorial  
https://youtu.be/1SDvth66i-4  
https://fabianlee.org/2021/01/10/kvm-creating-and-reverting-libvirt-external-snapshots/  

How to enlarge Qemu/kvm virtual disk  
https://youtu.be/N7wvqHvmSN8  

