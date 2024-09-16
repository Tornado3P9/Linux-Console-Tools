# hashcat

Hashcat is an advanced password recovery tool that is used for cracking encrypted passwords. It supports a wide array of hashing algorithms, such as MD5, SHA-1, SHA-256, WPA/WPA2, and many others. Hashcat is known for its speed and versatility, as it can run on different operating systems and can utilize the power of both CPUs and GPUs to accelerate the cracking process. It is an open-source project and is widely used by security professionals and ethical hackers for legitimate password recovery and security testing purposes.  
More information: <https://hashcat.net/wiki/doku.php?id=hashcat>.  
Example in: <https://asecuritysite.com/hash/rust_argon>

```bash
# Perform a brute-force attack (mode 3) with the default hashcat mask:
hashcat --hash-type hash_type_id --attack-mode 3 hash_value

# Perform a brute-force attack (mode 3) with a known pattern of 4 digits:
hashcat --hash-type hash_type_id --attack-mode 3 hash_value "?d?d?d?d"

# Perform a brute-force attack (mode 3) using at most 8 of all printable ASCII characters:
hashcat --hash-type hash_type_id --attack-mode 3 --increment hash_value "?a?a?a?a?a?a?a?a"

# Perform a dictionary attack (mode 0) using the RockYou wordlist of a Kali Linux box:
hashcat --hash-type hash_type_id --attack-mode 0 hash_value /usr/share/wordlists/rockyou.txt

# Perform a rule-based dictionary attack (mode 0) using the RockYou wordlist mutated with common password variations:
hashcat --hash-type hash_type_id --attack-mode 0 --rules-file /usr/share/hashcat/rules/best64.rule hash_value /usr/share/wordlists/rockyou.txt

# Perform a combination attack (mode 1) using the concatenation of words from two different custom dictionaries:
hashcat --hash-type hash_type_id --attack-mode 1 hash_value /path/to/dictionary1.txt /path/to/dictionary2.txt

# Show result of an already cracked hash:
hashcat --show hash_value

# Show all example hashes:
hashcat --example-hashes
```
