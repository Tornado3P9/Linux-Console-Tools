## Grub 2

```bash
# re-write the MBR to your harddrive
sudo grub-setup /dev/sdX

# re-install
sudo grub-install /dev/sdX

# modify configurations
nano /etc/default/grub

# full documentation for the options in this file:
info -f grub -n 'Simple configuration'

# re-write the configuration (most times this is what you want)
sudo update-grub
```
