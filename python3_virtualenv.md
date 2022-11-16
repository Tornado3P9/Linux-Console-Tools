## Python Virtual Environment

https://wiki.ubuntuusers.de/virtualenv/
```bash
# Install python3-venv
sudo apt install python3-venv

# for easy use create alias-shortcuts:
# alias ve='python3 -m venv ./venv'
# alias ae='deactivate &> /dev/null; source ./venv/bin/activate'
# alias de='deactivate'
echo -e "\nalias ve='python3 -m venv ./venv' \nalias ae='deactivate &> /dev/null; source ./venv/bin/activate' \nalias de='deactivate' \n" >> ~/.bash_aliases

# create
ve

# start
ae

# and stop virtual environments
de
```
