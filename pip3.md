## pip

```bash
sudo apt install python3-pip

python3 -m pip install --upgrade pip

pip3 install --user Flask
pip3 show Flask
pip3 uninstall Flask

pip3 list

pip3 install -U Flask (Upgrade)


# save package-list in an extern file which can be uploaded to github:
# https://note.nkmk.me/en/python-pip-install-requirements/

pip list --format=freeze > requirements.txt

#click==8.0.1
#Flask==2.0.1
#itsdangerous==2.0.1
#Jinja2==3.0.1
#MarkupSafe==2.0.1
#Werkzeug==2.0.1
#...

# install packages from list:
pip install -r requirements.txt
```

# show requirements for the a pip package (e.g. krpc)
pip show krpc
