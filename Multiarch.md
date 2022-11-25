## https://wiki.debian.org/Multiarch/HOWTO

```bash
# dpkg architectures are stored in /var/lib/dpkg/arch.
cat /var/lib/dpkg/arch

# check the current machine architecture
dpkg --print-architecture # -> amd64

# To add an extra architecture, type 'dpkg --add-architecture <arch>'
sudo dpkg --add-architecture i386

# check for the newly added architecture
dpkg --print-foreign-architectures # -> i386

# To remove an architecture
sudo dpkg --remove-architecture i386
```
