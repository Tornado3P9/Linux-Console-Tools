# getting around the file system

```bash
.                  # the current working directory
..                 # the parent directory
~                  # the user's home directory
$HOME              # the user's home directory
/home/$USER        # the user's home directory
 
cd                 # changing the current directory to user's home directory
cd ~               # changing the current directory to user's home directory
cd $HOME           # changing the current directory to user's home directory
cd -               # flip between the previous two directories you navigated to
                   # for that, cd looks up the variable $OLDPWD
cd /path_to_dir    # changing the current directory to path_to_dir
cd ~/Documents     # changing the current directory to ~/Documents
cd $HOME/Documents # changing the current directory to ~/Documents

pwd                # printing the current working directory file path
echo $HOME         # printing the home directory file path
echo ~             # printing the home directory file path

mkdir folder && cd $_   # create directory and 'cd' into it without having to write the whole filepath
```

## autojump

```bash
sudo apt install autojump
```

Quickly jump among the directories you visit the most.  
Aliases like j or jc are provided for even less typing.  
More information: https://github.com/wting/autojump.

```bash
# Jump to a directory that contains the given pattern:
j pattern

# Jump to a sub-directory (child) of the current directory that contains the given pattern:
jc pattern

# Open a directory that contains the given pattern in the operating system file manager:
jo pattern

# Remove non-existing directories from the autojump database:
j --purge

# Show the entries in the autojump database:
j -s
```
