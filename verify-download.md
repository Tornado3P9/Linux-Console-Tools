
## short examples
```bash
echo "b317d87b0a3d5b568f48a92dcabfc4bc51fe58d9f67ca13b013f1b8329d1306d *debian-10.7.0-amd64-netinst.iso" | shasum -a 256 --check
#debian-10.7.0-amd64-netinst.iso: OK

shasum -a 256 -c/--check program-*.DIGEST
# program-x86_64.AppImage: OK

sha256sum program.deb
#cb673127833245c3f7793072bf477049c3e0595f87bb12515452f60898b83288  program.deb

shasum -a 256 sphinx_greenlight_0_61.img.zip
#696f22cabe658a1a754315a1af39ed0d9471c7a480c4f40d1525bde50b911a88  sphinx_greenlight_0_61.img.zip

md5sum ubuntu-11.10-dvd-i386.iso
#8044d756b7f00b695ab8dce07dce43e5 ubuntu-11.10-dvd-i386.iso

echo -n "Your-String-Here" | md5sum
#e4e6ca42342f95978a17c6257593c1e1  -
# (-n) do not output the trailing newline but actually stop the string right after the 'e'
```


## long example
https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/verify-CloudWatch-Agent-Package-Signature.html  
https://mirrors.tripadvisor.com/centos-vault/3.4/docs/html/rhel-sbs-en-3/s1-gnupg-import.html  
https://www.veracrypt.fr/en/Downloads.html  

```bash
# Import new key:
gpg --import amazon-cloudwatch-agent.gpg   #(Or: gpg --import newkey.txt (Or: gpg --import key.asc
#gpg: key 3B789C72: public key "Amazon CloudWatch Agent" imported
#gpg: Total number processed: 1
#gpg: imported: 1 (RSA: 1)

# To check that the process was successful:
gpg --list-keys


# Verify the fingerprint by running the following command, replacing key-value with the value from the preceding step:
key-value=3B789C72
gpg --fingerprint $key-value
#pub   2048R/3B789C72 2017-11-14
#      Key fingerprint = 9376 16F3 450B 7D80 6CBD  9725 D581 6730 3B78 9C72
#uid                  Amazon CloudWatch Agent

# Download the program and it's signature file
wget https://s3.amazonaws.com/amazoncloudwatch-agent/ubuntu/arm64/latest/amazon-cloudwatch-agent.deb
wget https://s3.amazonaws.com/amazoncloudwatch-agent/ubuntu/arm64/latest/amazon-cloudwatch-agent.deb.sig

# Verify the downloaded program with the signature and the earlier imported key
signature-filename=amazon-cloudwatch-agent.deb.sig
program-filename=amazon-cloudwatch-agent.deb
 
gpg --verify $signature-filename $program-filename
#gpg: Signature made Wed 29 Nov 2017 03:00:59 PM PST using RSA key ID 3B789C72
#gpg: Good signature from "Amazon CloudWatch Agent"
#gpg: WARNING: This key is not certified with a trusted signature!
#gpg:          There is no indication that the signature belongs to the owner.
#Primary key fingerprint: 9376 16F3 450B 7D80 6CBD  9725 D581 6730 3B78 9C72
```

## sign files and verify signatures with minisign

https://jedisct1.github.io/minisign/
