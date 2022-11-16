### Version 1: fpm

You can use these commands as below to convert rpm to deb package.

```bash
sudo apt install ruby ruby-dev rubygems build-essential rpm
sudo gem install --no-document fpm         
sudo fpm -s rpm -t deb rpmFileName.rpm
```

If you want to convert deb to rpm then simply change last command as follows:

```bash
sudo fpm -s deb -t rpm debFileName.deb
```

You can follow this **[fpm](https://fpm.readthedocs.io/en/latest/index.html)** package link for more details.

### Version 2: alien

```bash
sudo apt install alien
alien --to-deb rpmFileName.rpm
```

You can follow this **[alien](https://manpages.ubuntu.com/manpages/jammy/man1/alien.1p.html)** package link for more details.


### Links:
https://www.redhat.com/sysadmin/create-rpm-package