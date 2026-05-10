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
apt list --installed | grep "auto-removable"  # To list removable packages, which are packages that were automatically installed to satisfy dependencies for other packages and are no longer needed

dpkg --get-selections
dpkg --list
dpkg --list | grep package_name
dpkg --list | grep apache
dpkg -p package_name

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
# The apt-cache command is used to interact with the package cache on your system. It doesn't create or modify the cache but allows you to query it. 
apt-cache search --names-only package_name
apt-cache depends package_name

# The `apt-file` command will return all the packages where the package name or any file name stored in it matches the specified search keyword.
# If you get an error while using this utility, you can run apt install apt-file and then do an apt-file update before beginning your search.
apt-file search [keyword]

# shows detailed information on this package and the available versions from the repositories. It also shows the priority of each version, which determines which version will be installed or upgraded.
apt-cache policy obs-studio
apt policy obs-studio

# Using the ldd command will list all the shared libraries that the program depends on. Note that ldd works for dynamically linked executables:
ldd /path/to/your/program
```

Verify
```bash
# `dpkg -V` checks the installed files against the package database and reports any discrepancies.
# The '5' indicates a change in the MD5 checksum, and 'c' denotes a configuration file.
# By using `grep -v`, the command excludes this line from the output, showing only other types of changes.
dpkg -V | grep -v '??5?????? c'
```


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


Download
```bash
# Download a program and all it's dependencies
apt-get download program_name
apt-get download $(apt-cache depends program_name | grep -E 'Depends|Recommends' | awk '{print $2}')

# Optionally extract all to the same directory (.)
for pkg in *.deb; do dpkg-deb -x "$pkg" .; done
```


Delete
```bash
# Only Deinstallation
sudo apt-get remove <application_name>
sudo dpkg -r <application_name>
    
# delete completely (also delete the repository from the 'apt update' list)
sudo apt-get purge <package-name>
sudo dpkg -P <package-name>
    
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


Problems?
```bash
# Clear the Cache
sudo apt-get clean

# Update Package Lists
sudo apt-get update

# Fix Broken Dependencies
sudo apt-get install -f

# Remove Unused Packages
sudo apt-get autoremove
```

Keys https://mangohost.net/blog/how-to-handle-apt-key-and-add-repository-deprecation-using-gpg-on-ubuntu-24/
```bash
# ------------------------------------------
# Modern GPG Key Management Implementation
# ------------------------------------------

# Old deprecated method (don't use this)
wget -qO - https://example.com/key.gpg | sudo apt-key add -

# New method - step by step
# 1. Create directory if it doesn't exist
sudo mkdir -p /etc/apt/keyrings

ls -lh /etc/apt/keyrings
ls -lh /usr/share/keyrings

# 2. Download and convert the key
wget -qO- https://example.com/key.gpg | gpg --dearmor | sudo tee /etc/apt/keyrings/example.gpg > /dev/null

# 3. Set proper permissions
sudo chmod 644 /etc/apt/keyrings/example.gpg

# 4. Add repository with signed-by parameter
echo "deb [signed-by=/etc/apt/keyrings/example.gpg] https://example.com/repo stable main" | sudo tee /etc/apt/sources.list.d/example.list

# -----------------------------------------------
# Handling Different Key Formats and Conversion
# -----------------------------------------------

# For ASCII-armored keys (usually .asc files)
wget -qO- https://example.com/key.asc | gpg --dearmor | sudo tee /etc/apt/keyrings/example.gpg > /dev/null

# For keys that need keyserver retrieval
gpg --keyserver keyserver.ubuntu.com --recv-keys KEYID
gpg --export KEYID | sudo tee /etc/apt/keyrings/example.gpg > /dev/null

# For keys distributed as .pub files
curl -fsSL https://example.com/key.pub | sudo gpg --dearmor -o /etc/apt/keyrings/example.gpg

# Verify key fingerprint (important security step)
gpg --show-keys /etc/apt/keyrings/example.gpg

# --------------------------------
# Permission Issues?
# --------------------------------

# Fix common permission problems
sudo chmod 644 /etc/apt/keyrings/*.gpg
sudo chown root:root /etc/apt/keyrings/*.gpg

# Verify permissions
ls -la /etc/apt/keyrings/

# --------------------------------
# Key Format Errors?
# --------------------------------

# Check if key is already in binary format
file downloaded-key.gpg

# If it's already binary, don't use gpg --dearmor
sudo cp downloaded-key.gpg /etc/apt/keyrings/example.gpg

# If it's ASCII, convert it
gpg --dearmor downloaded-key.asc | sudo tee /etc/apt/keyrings/example.gpg > /dev/null

# --------------------------------
# Repository Update Failures?
# --------------------------------

# Check repository syntax
sudo apt update 2>&1 | grep -i "malformed\|invalid"

# Verify key association
grep -r "signed-by" /etc/apt/sources.list.d/

# Test specific repository
sudo apt-cache policy package-name
```
