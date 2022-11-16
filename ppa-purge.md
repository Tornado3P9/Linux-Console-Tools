Version A:
```bash
sudo apt install ppa-purge
apt policy
sudo ppa-purge ppa:kisak/kisak-mesa
```

Version B:
```bash
sudo apt purge ppa_program_name
apt policy
sudo add-apt-repository --remove ppa:<PPA_NAME>
```
