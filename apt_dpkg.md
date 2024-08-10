# Tipp: Using APT (Advanced Package Tool) is recommended

Search
```bash
apt search <Program Name>

apt list --upgradeable
apt list firefox
apt list -a firefox

apt list --installed
apt list --installed | grep package_name
apt list --installed | grep apache

dpkg --get-selections
dpkg --list
dpkg --list | grep package_name
dpkg --list | grep apache

# Count the number of installed packages
apt list --installed | wc -l
dpkg --list | grep -v "^Listing" | wc --lines

# Or you can even display information about a downloaded debian package
# https://www.cyberciti.biz/faq/how-to-extract-a-deb-file-without-opening-it-on-debian-or-ubuntu-linux/
apt show ./program.deb
apt show coreutils
dpkg --info program.deb
dpkg -s coreutils
dpkg -L coreutils  # create a list of files installed by the coreutils package
dpkg --contents program.deb  # -c, --contents
ar tv program.deb (if possible just use a grafical UI, maybe 'Engrampa')

# https://itsfoss.com/apt-cache-command/
# apt-cache
apt-cache search --names-only package_name

# show detailed information on this package
apt-cache policy obs-studio
```
https://www.linuxfordevices.com/tutorials/ubuntu/apt-command-to-search-for-a-package

Update (get the info) + Upgrade (make the changes)
```bash
sudo apt update
sudo apt upgrade
    
# OR using a single line with the -y for automaticly answering yes when asked
sudo apt update && sudo apt upgrade -y
```

Download-Only (seldom used)
```bash
# Remove any packages currently saved in the cache by running
sudo apt clean

# Download the packages
sudo apt download <package>
sudo apt install -d <package1> <package2> <package3>

# All packages downloaded via this method will be saved in the `/var/cache/apt/archives` directory
sudo apt install --download-only <package1> <package2> <package3>
```
https://askubuntu.com/a/1206168


Install
```bash
# install from the online repository (or 'free app store')
sudo apt install package_name

# install a downloaded debian file
sudo apt install ./package_name.deb
sudo dpkg -i package_name.deb
# If you are using apt to install your debian files, this will cause the package manager
# to install any dependencies before your main package is installed. If you use dpkg -i to install
# the main package, this will cause dpkg to fail to install it until you manually install the dependencies.

# usually never needed (if 'dpkg -i' created an issue, run the following 'apt -f' command and then run the above dpkg command again)
sudo apt -f install
sudo apt install package_name --fix-missing

# The option re-installs packages that are already installed and at the newest version.
sudo apt-get --reinstall install Package1 Package2
```

Delete
```bash
# Only Deinstallation
sudo apt-get remove <application_name>
sudo dpkg -r <application_name>
    
# delete completely (also delete the repository from the 'apt update' list)
sudo apt-get purge <package-name>
sudo dpkg -p <package-name>
    
# remove any unused packages
sudo apt autoremove
sudo apt remove --autoremove <package-name>

# delete only the repository
ls -l /etc/apt/sources.list.d/
sudo rm /etc/apt/sources.list.d/<Repo_Filename>.list

# delete the package lists and metadata for the installed software packages managed by APT
ls /var/lib/apt/dists/
rm -rf /var/lib/apt/dists/*
```

Hold
```bash
# If a package is marked "hold", it is held back: The package cannot be installed, upgraded, or removed until the hold mark is removed.
sudo apt-mark hold snapd

# Show Holded
apt-mark showhold

# Cancel a previously set hold on a package to allow all actions again
sudo apt-mark unhold snapd
```

