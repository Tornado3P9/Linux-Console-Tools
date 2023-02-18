# wget + curl

## curl

https://linuxhint.com/curl_bash_examples/  
curl is a tool to transfer data from or to a server, using one of the supported protocols  
(DICT, FILE, FTP, FTPS, GOPHER, HTTP, HTTPS, IMAP, IMAPS, LDAP, LDAPS, POP3, POP3S, RTMP, RTSP, SCP, SFTP, SMB, SMBS, SMTP, SMTPS, TELNET and TFTP).  
The command is designed to work without user interaction.

```bash
# Install curl
sudo apt install curl

# Example, installing docker:
curl -fsSL https://get.docker.com -o get-docker.sh
sudo bash get-docker.sh
sudo usermod -aG docker username
sudo reboot

# Example, installing docker:
curl -sSL https://get.docker.com | sh
sudo usermod -aG docker $(whoami)
sudo reboot

# Example, downloading and installing ddimage script
curl -sS https://raw.githubusercontent.com/Tornado3P9/installscript-linux/master/ddimage -O
chmod +x ddimage
sudo mv ddimage /usr/bin/
ddimage

# Example downloading a binary and installing it to the /usr/local/bin/ directory
sudo curl -L https://website/downloads/latest/program -o /usr/local/bin/program
sudo chmod a+rx /usr/local/bin/program
```


## wget

Download from multiple URLs:
```bash
# Fill a text file 'urls.txt' with some URLs:
https://website/program-latest-amd64.deb
https://website/checksums.sha256

# Then download the content of the file with:
wget -i urls.txt

# Example downloading a binary and installing it to the /usr/local/bin/ directory
sudo wget https://website/downloads/latest/program -O /usr/local/bin/program
sudo chmod a+rx /usr/local/bin/program
```





## Example: download images from website

Version A:
```bash
#To download just one specific file use the -L option:

wget -L https://raw.githubusercontent.com/Tornado3P9/Konsolentools/master/wget_images_from_website.txt

#To download all images from the specified page with wget you can use this command:

wget -i `wget -qO- https://website.com/ | sed -n '/<img/s/.*src="\([^"]*\)".*/\1/p'`

#In this example HTML file is download with wget to STDOUT, parsed with sed so that only img URL remain and passed to wget -i as an input list for downloading.
#Note that it will download only the images on this page, but they might just be thumbnails (350px wide).
#If you'd like to download full images, you should go a step forward and change the parsed IMG urls so that they correspond the hi-res images. You can do it with sed or awk:

wget -i `wget -qO- https://website.com/ | sed -n '/<img/s/.*src="\([^"]*\)".*/\1/p' | awk '{gsub("thumb-350-", "");print}'`

# To download the whole website (wget --mirror --convert-links --adjust-extension --page-requisites --no-parent), short version:
wget -mkEpnp https://website.com/
```

Version B:
```bash
# get all pages
curl 'http://domain.com/id/[1-151468]' -o '#1.html'

# get all images
grep -oh 'http://pics.domain.com/pics/original/.*jpg' *.html >urls.txt

# download all images
sort -u urls.txt | wget -i-

## use grep -oh to remove the filenames before urls.
```
