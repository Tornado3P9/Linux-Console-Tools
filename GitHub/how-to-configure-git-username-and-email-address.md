## [How to configure Git Username and Email Address](https://vegastack.com/tutorials/how-to-configure-git-username-and-email-address/) from 

#### Set Global Git Username and Password

Commits on all repositories on your system that don't have repository-specific data are connected with the global git login and password.  

Run the `git config` command with the `--global` option to set your global commit name and email address:  

```bash
git config --global user.name "Your Name"
git config --global user.email "youremail@yourdomain.com"
```

After that, execute the following command to verify that the information is correct:  

```bash
git config --list

```
```
Output

user.name=Your Name
user.email=youremail@yourdomain.com
```

The values are saved in the `~/.gitconfig` that is a global configuration file:  

```bash
[user]
    name = Your Name
    email = youremail@yourdomain.com
```

You can also use your text editor to edit the file, although the git config command is advised.  

For a Single Repository just emit the `--global` parameter. You have to be inside the repository's root directory.  
The repository-specific settings are saved in the `.git/config` file located in the repository's root directory.  
