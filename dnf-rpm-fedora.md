# DNF and RPM

Fedora uses **DNF** for repository/package management and **RPM** for low-level `.rpm` package operations. On newer Fedora releases, `dnf5` may be the underlying command; `dnf` generally remains the compatible command.

## Search and inspect

```bash
# Search repositories by package name, summary, and description
dnf search "<program name>"

# Search package names only
dnf repoquery --whatprovides '*<package_name>*'

# List available versions
dnf list --showduplicates <package_name>

# List installed packages
dnf list --installed

# Search installed packages
dnf list --installed | grep package_name
dnf list --installed | grep apache

# List packages with available updates
dnf check-update

# List packages that can be upgraded
dnf list --upgrades

# List packages installed as dependencies and no longer required
dnf repoquery --installed --extras

# List all installed packages
rpm -qa

# Search installed packages
rpm -qa | grep package_name
rpm -qa | grep apache

# Display package information from repositories
dnf info <package_name>

# Display information about an installed package
rpm -qi <package_name>

# Display information about a downloaded RPM
rpm -qip ./program.rpm
```

`dnf info` shows repository metadata, while `rpm -qi` shows the metadata recorded for an installed package.

```bash
# Count installed packages
rpm -qa | wc -l

# List files installed by a package
rpm -ql <package_name>

# List files contained in a downloaded RPM
rpm -qlp ./program.rpm

# Find which installed package owns a file
rpm -qf /path/to/file

# Find which package provides a file or capability
dnf provides '/usr/bin/<program>'
dnf provides '*/<filename>'

# Show package dependencies
dnf repoquery --requires <package_name>

# Show reverse dependencies
dnf repoquery --whatrequires <package_name>

# Show package dependencies, including recommended packages
dnf repoquery --requires --resolve <package_name>

# Show available package versions and repositories
dnf repoquery --available --qf \
'%{name}-%{epoch}:%{version}-%{release}.%{arch} from %{repoid}' \
<package_name>

# List enabled repositories
dnf repolist

# List all repositories, including disabled repositories
dnf repolist --all
```

## Verify installed files

RPM can verify installed files against the package database:

```bash
# Verify all installed packages
sudo rpm -Va

# Verify one package
sudo rpm -V <package_name>

# Show only modified files
sudo rpm -Va | grep -v '^missing'
```

The RPM verification output uses flags such as:

- `5` — MD5 checksum differs
- `S` — file size differs
- `M` — permissions or mode differs
- `U` — owner differs
- `G` — group differs
- `T` — modification time differs
- `c` — configuration file

For example:

```text
.M.......  c /etc/example.conf
```

means that the configuration file’s permissions or mode differs from the package’s original version.

## Update and upgrade

Unlike APT, DNF normally refreshes repository metadata automatically when needed.

```bash
# Refresh repository metadata
sudo dnf makecache

# Check for available updates
dnf check-update

# Upgrade all packages
sudo dnf upgrade

# Upgrade automatically without confirmation
sudo dnf upgrade -y

# Refresh metadata and upgrade
sudo dnf makecache && sudo dnf upgrade -y

# Preview an upgrade without making changes
sudo dnf upgrade --assumeno

# Show the transaction before proceeding
sudo dnf upgrade
```

On Fedora, `dnf upgrade` is the usual equivalent of both `apt upgrade` and most uses of `apt full-upgrade`. For a Fedora release upgrade, use the Fedora-supported system-upgrade procedure rather than simply changing repository files.

## Download only

```bash
# Remove cached packages and metadata
sudo dnf clean all

# Download an RPM without installing it
dnf download <package_name>
```

The `dnf download` command may require the download plugin:

```bash
sudo dnf install dnf-plugins-core
```

Download a package and its dependencies:

```bash
dnf download --resolve <package_name>
```

Download packages to a specific directory:

```bash
mkdir -p ~/rpm-downloads
dnf download --resolve --destdir ~/rpm-downloads <package_name>
```

Download the RPM corresponding to an installed package:

```bash
dnf download --installed <package_name>
```

The normal DNF cache is located below:

```bash
/var/cache/dnf/
```

You can inspect cached RPMs with:

```bash
find /var/cache/dnf -type f -name '*.rpm'
```

## Install

```bash
# Install from enabled repositories
sudo dnf install <package_name>

# Install multiple packages
sudo dnf install <package1> <package2> <package3>

# Install a downloaded RPM and resolve dependencies
sudo dnf install ./package_name.rpm

# Reinstall an installed package
sudo dnf reinstall <package_name>

# Install without confirmation
sudo dnf install -y <package_name>
```

Low-level RPM installation:

```bash
sudo rpm -Uvh ./package_name.rpm
```

`rpm` does not resolve dependencies from repositories. Prefer `dnf install ./package_name.rpm` for local RPM files because DNF can install their dependencies automatically.

Useful RPM options:

```bash
# Install a new package
sudo rpm -ivh ./package_name.rpm

# Upgrade or install a package
sudo rpm -Uvh ./package_name.rpm

# Replace an installed package with the downloaded version
sudo rpm -Fvh ./package_name.rpm
```

## Download and extract an RPM

```bash
# Download a package and all resolvable dependencies
dnf download --resolve <package_name>

# Extract one RPM without installing it
mkdir extracted
rpm2cpio ./package_name.rpm | cpio -idmv -D extracted
```

Extract all RPMs in the current directory:

```bash
mkdir extracted

for pkg in ./*.rpm; do
    rpm2cpio "$pkg" | cpio -idmv -D extracted
done
```

Inspect an RPM without installing it:

```bash
# Package metadata
rpm -qip ./package_name.rpm

# Files inside the RPM
rpm -qlp ./package_name.rpm

# Required capabilities and dependencies
rpm -qp --requires ./package_name.rpm

# Package scripts
rpm -qp --scripts ./package_name.rpm
```

## Delete

```bash
# Remove a package
sudo dnf remove <package_name>

# Remove a package and unused dependencies
sudo dnf remove --setopt=clean_requirements_on_remove=True <package_name>

# Find packages that are no longer required
dnf repoquery --installed --extras

# Remove packages installed as dependencies that are no longer needed
sudo dnf autoremove
```

Low-level RPM removal:

```bash
sudo rpm -e <package_name>
```

Prefer `dnf remove`, because it checks dependencies and performs the transaction more safely.

## Repository management

Fedora repository definitions are usually stored here:

```bash
/etc/yum.repos.d/
```

List repository files:

```bash
ls -l /etc/yum.repos.d/
```

List enabled repositories:

```bash
dnf repolist

# More detailed repository information
dnf repoinfo
```

With `dnf-plugins-core` installed:

```bash
# Install the repository-management plugin
sudo dnf install dnf-plugins-core

# Enable a repository
sudo dnf config-manager setopt <repo_id>.enabled=1

# Disable a repository
sudo dnf config-manager setopt <repo_id>.enabled=0

# Set a repository option
sudo dnf config-manager setopt <repo_id>.priority=90
```

For a repository you added manually, remove its `.repo` file:

```bash
sudo rm /etc/yum.repos.d/<repository>.repo
sudo dnf clean all
sudo dnf makecache
```

Do not delete DNF’s internal metadata directories manually. Use:

```bash
sudo dnf clean all
sudo yum clean all # both are actually links to /usr/bin/dnf5

# Check with
du -sh /var/cache/yum
```

## Repository GPG keys

RPM repositories normally declare their signing key with the `gpgkey=` option in a `.repo` file. Unlike the Debian `signed-by` approach, the repository configuration generally handles the key association.

Inspect repository configuration:

```bash
grep -RniE '^\[|^name=|^baseurl=|^metalink=|^gpgcheck=|^gpgkey=' \
    /etc/yum.repos.d/
```

A typical repository file looks like this:

```ini
[example]
name=Example Repository
baseurl=https://example.com/repo/$releasever/$basearch/
enabled=1
gpgcheck=1
gpgkey=https://example.com/repo/RPM-GPG-KEY-example
```

Install a repository’s official release RPM when the repository provider supplies one:

```bash
sudo dnf install ./example-release.rpm
```

Import a downloaded key manually:

```bash
sudo rpm --import https://example.com/repo/RPM-GPG-KEY-example
```

List imported RPM keys:

```bash
rpm -qa 'gpg-pubkey*'
rpm -qi 'gpg-pubkey*'
```

Verify a key fingerprint:

```bash
gpg --show-keys ./RPM-GPG-KEY-example
```

For an ASCII-armored key:

```bash
gpg --dearmor < RPM-GPG-KEY-example.asc > RPM-GPG-KEY-example.gpg
sudo rpm --import RPM-GPG-KEY-example.gpg
```

Check that repository signature verification is enabled:

```bash
grep -Rni '^gpgcheck=' /etc/yum.repos.d/
```

Avoid disabling signature checks. `--nogpgcheck` should only be used temporarily for a package or repository you fully trust:

```bash
sudo dnf install --nogpgcheck ./package_name.rpm
```

## Hold or exclude packages

DNF does not use `apt-mark hold` in exactly the same way. To prevent a package from being upgraded, use the version-lock plugin:

```bash
sudo dnf install python3-dnf-plugin-versionlock

# Lock the currently installed version
sudo dnf versionlock add <package_name>

# List locked packages
sudo dnf versionlock list

# Remove a lock
sudo dnf versionlock delete <package_name>

# Remove all locks
sudo dnf versionlock clear
```

Alternatively, exclude a package in `/etc/dnf/dnf.conf`:

```ini
exclude=<package_name>
```

Multiple packages can be excluded:

```ini
exclude=package1 package2 package3
```

## Problems and repair

```bash
# Clear cached metadata and downloaded packages
sudo dnf clean all

# Rebuild repository metadata cache
sudo dnf makecache

# Check for dependency problems
sudo dnf check

# Attempt to synchronize installed packages with repository versions
sudo dnf distro-sync

# Preview the synchronization
sudo dnf distro-sync --assumeno

# Reinstall a package
sudo dnf reinstall <package_name>

# Find packages with missing files
sudo rpm -Va | grep '^missing'

# Rebuild the RPM database if it is damaged
sudo rpm --rebuilddb
```

If a transaction was interrupted:

```bash
sudo dnf history
sudo dnf history info <transaction_id>
sudo dnf history undo <transaction_id>
```

Use `dnf history undo` carefully, because undoing a transaction can remove or downgrade packages.

## Quick translation table

| Debian/Ubuntu | Fedora |
|---|---|
| `apt search name` | `dnf search name` |
| `apt update` | `dnf makecache` / `dnf check-upgrade` |
| `apt upgrade` | `dnf upgrade` |
| `apt install name` | `dnf install name` |
| `apt install ./file.deb` | `dnf install ./file.rpm` |
| `apt remove name` | `dnf remove name` |
| `apt purge name` | `dnf remove name` |
| `apt autoremove` | `dnf autoremove` |
| `apt show name` | `dnf info name` |
| `dpkg -s name` | `rpm -qi name` |
| `dpkg -L name` | `rpm -ql name` |
| `dpkg -S /path/file` | `rpm -qf /path/file` |
| `dpkg -V` | `rpm -Va` |
| `dpkg -i file.deb` | `rpm -Uvh file.rpm` |
| `apt download name` | `dnf download name` |
| `apt-file search file` | `dnf provides '*/file'` |
| `apt-mark hold name` | `dnf versionlock add name` |
| `/etc/apt/sources.list.d/` | `/etc/yum.repos.d/` |
| `/var/cache/apt/archives/` | `/var/cache/dnf/` |

The most important practical distinction is: use **DNF for normal package operations**, and use **RPM for inspecting, verifying, installing, or extracting individual RPM files**.
