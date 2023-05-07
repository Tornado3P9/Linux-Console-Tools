If a script or application is unknown by the terminal shell,  
then it probably wasn't added to the path variable:
```bash
echo $PATH

env | grep ^PATH   # grep lines starting with 'PATH' from env output also works
```
gets you all the directories that are part of the path-environment-variable  
you can place your program or script in one of these subdirectories.  

OR add a directory to the PATH:
```bash
# example 1:
PATH=$PATH:new_directory_path
export PATH

# example 2:
export PATH="$PATH:$HOME/.local/bin"
```

make the PATH persistent by editing one of the bash configuration files:
```bash
~/.bashrc
/etc/profile
~/.bash_profile
~/.bash_login
~/.profile

# example 3:
if [ -d "$HOME/.local/bin" ] ; then
  PATH="$PATH:$HOME/.local/bin"
fi
```
This may differ from one linux distribution to the other.  
Use `/etc/profile` to make the changes apply to all users  
Use `~/.bashrc` to make the changes apply to just the current user  

Also don't forget to reload the session (logout + login) or reload the file:
```bash
source ~/.bashrc
```
