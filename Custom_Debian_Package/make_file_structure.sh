#!/bin/bash
# You can also use FPM to build backages https://github.com/jordansissel/fpm
set -uo pipefail
trap 's=$?; echo "$0: Error on line "$LINENO": $BASH_COMMAND"; exit $s' ERR
IFS=$'\n\t'



# Define some constants
PROGRAM=program_name
VERSION=1.0
LICENSE=MIT
VENDOR=Vendor_name
ARCHITECTURE=all
CREATOR_NAME=God
CREATOR_EMAIL=god@gmail.com
PRIORITY=optional
DEPENDENCIES=libc6
DESCRIPTION="Best description ever"
DATE=$(date +"%dth %b %Y")
DOCUMENTATION=https://github.com/somewhere
HOMEPAGE=https://homepage.com
FINAL_PROGRAM=program_name-1.0-arm64.deb



# Create Example File Structure (only the DEBIAN/ and usr/bin/ folders are absolutely necessary -> that's where the control file and the binary are located)
mkdir -p mydebianpackage/{DEBIAN,etc/{systemd/system,logrotate.d,${PROGRAM}/${PROGRAM}.d},usr/{bin,lib/${PROGRAM}/scripts,share/{doc/${PROGRAM},man/man1}},var/log/${PROGRAM}}
# Create Example files ( the binary goes to usr/bin/ )
touch mydebianpackage/{DEBIAN/{conffiles,control,postinst,postrm,preinst,prerm},etc/{${PROGRAM}/${PROGRAM}.conf,systemd/system/${PROGRAM}.service,logrotate.d/${PROGRAM}},usr/{lib/${PROGRAM}/scripts/{${PROGRAM}.service,init.sh},share/{doc/${PROGRAM}/changelog.gz,man/man1/${PROGRAM}.1}}}
# Besides the binary there are also some other files that are supposed to be made executable
chmod +x mydebianpackage/{DEBIAN/{postinst,postrm,preinst,prerm},usr/lib/${PROGRAM}/scripts/init.sh}



make_control_file () {
cat <<EOF >> mydebianpackage/DEBIAN/control
Package: $PROGRAM
Version: $VERSION
License: $LICENSE
Vendor: $VENDOR
Architecture: $ARCHITECTURE
Maintainer: $CREATOR_NAME<$CREATOR_EMAIL>
Priority: $PRIORITY
Homepage: $HOMEPAGE
Depends: $DEPENDENCIES
Description: $DESCRIPTION
EOF
}
make_control_file
### About the control file:
#Package: Identifies the package name
#Version: Version of the package
#Section: This field specifies an application area into which the package has been classified.Eg base, debug, devel, doc, editors, education, electronics, embedded, fonts, gamesetc
#Priority: You can set the priority of the package, we have these types: required, important, important, optional, extra
#Architecture: You can define the architecture of the application (amd64 ,i386 ,arm64 ,etc).
#Depends: If your package is depends on other package you will mention here, if you install this package from high level tool (apt, aptitude) then it will automatically download its dependencies.
#Maintainer: who maintains this package
#Description: Description of the package



cat <<EOF >> mydebianpackage/DEBIAN/conffiles
/etc/logrotate.d/${PROGRAM}
/etc/${PROGRAM}/${PROGRAM}.conf
EOF

cat <<EOF >> mydebianpackage/DEBIAN/postinst
#!/bin/bash
#...
EOF

cat <<EOF >> mydebianpackage/DEBIAN/postrm
#!/bin/bash
#...
EOF

cat <<EOF >> mydebianpackage/DEBIAN/preinst
#!/bin/bash
#...
EOF

cat <<EOF >> mydebianpackage/DEBIAN/prerm
#!/bin/bash
#...
EOF

# As I don't have got a binary here, let's just make a bash file to have sth to look at:
cat <<EOF >> mydebianpackage/usr/bin/$PROGRAM
#!/bin/bash
echo Hello World
EOF
chmod +x mydebianpackage/usr/bin/$PROGRAM



# Creating the man page (man program_name)
cat <<EOF >> mydebianpackage/usr/share/man/man1/${PROGRAM}.1
.TH ${PROGRAM} 1 "${DATE}" "${VERSION}" "${PROGRAM} man page"
.SH NAME
${PROGRAM} \- does something
.SH SYNOPSIS
${PROGRAM}, the program returns nothing much right now
.SH OPTIONS
There are no options in the program currently
.SH DESCRIPTION
${PROGRAM} is a simple program
.SH SEE ALSO
puts(3) printf(3)
.SH AUTHOR
$CREATOR_NAME ($CREATOR_EMAIL)
EOF
gzip -9 mydebianpackage/usr/share/man/man1/${PROGRAM}.1



# Creating the systemd service file
cat <<EOF >> mydebianpackage/usr/lib/${PROGRAM}/scripts/${PROGRAM}.service
[Unit]
Description=$DESCRIPTION
Documentation=$DOCUMENTATION
After=network.target

[Service]
EnvironmentFile=-/etc/default/$PROGRAM
ExecStart=/usr/bin/$PROGRAM
ExecReload=/bin/kill -HUP \$MAINPID
Restart=on-failure
RestartForceExitStatus=SIGPIPE
KillMode=control-group

[Install]
WantedBy=multi-user.target
EOF
# You can put it inside etc/systemd/system/${PROGRAM}.service and manually enable it in systemctl
# Or you can put it inside "usr/lib/systemd/system/${PROGRAM}.service" and create a link to enable it "ln -sf /usr/lib/systemd/system/${PROGRAM}.service /etc/systemd/system/multi-user.target.wants/"
# Or you can put it inside "usr/lib/${PROGRAM}/scripts/${PROGRAM}.service" together with an "init.sh" file. Then add the following lines into the "postinst" file.
# Anyway, take your time with this one because it can get quite complicated!
#
#  PROGRAM=program_name
#  SCRIPT_DIR=/usr/lib/${PROGRAM}/scripts
#
#  function install_systemd {
#      cp -f $SCRIPT_DIR/${PROGRAM}.service $1
#      systemctl enable ${PROGRAM} || true
#      systemctl daemon-reload || true
#  }
#
#  function install_init {
#      cp -f $SCRIPT_DIR/init.sh /etc/init.d/${PROGRAM}
#      chmod +x /etc/init.d/${PROGRAM}
#  }
#
#  install_systemd /lib/systemd/system/${PROGRAM}.service
#  install_init


change_owner_privileges () {
  sudo chown -R root.root mydebianpackage/
  ls -lR mydebianpackage/
  tree mydebianpackage/
}
change_owner_privileges

# # Finally create the debian package!
# dpkg-deb --build mydebianpackage/ ${FINAL_PROGRAM}

