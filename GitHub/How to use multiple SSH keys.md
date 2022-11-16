https://stackoverflow.com/questions/29023532/how-do-i-use-multiple-ssh-keys-on-github  
https://vegastack.com/tutorials/how-to-configure-git-username-and-email-address/


## [Serban Constantin](https://stackoverflow.com/users/1598323/serban-constantin)
I'd use .ssh config to set up different configurations for each particular user.

For example, edit (or create) the config file in the .ssh folder under your users root, and add something similar to this:

```
Host user1-github
    HostName github.com
    User git
    IdentityFile ~/.ssh/user1_rsa
Host user2-github
    HostName github.com
    User git
    IdentityFile ~/.ssh/user2_rsa
```

Where `user1_rsa` and `user2_rsa` are the outputs of `ssh-keygen -t rsa -C "user1@example.com"` and `ssh-keygen -t rsa -C "user2@example.com"`

Then, when testing simply use `ssh -vT user1-github` and `ssh -vT user2-github`.

Also, when cloning repos use `git clone user1-github:username1/project.git` or `git clone user2-github:username2/project.git`.



## [Qeole](https://stackoverflow.com/users/3716552/qeole)

As a complement to Serban's solution, here is another way to use the `.ssh/config` file to distinguish the users. A bit more hacky, but does not require changing the host names.

Let's say you have a pro and a personal account, and that you set up your keys like this:

```
$ ssh-keygen -t rsa -f ~/.ssh/perso_rsa -C "nick@perso.org"
$ ssh-keygen -t rsa -f ~/.ssh/pro_rsa   -C "name.surname@pro.company.com"
```

Now most of the time, there is something you can use to distinguish the two identities. Typically, when working on a git repo, your git configuration is tied to the identity you want to use, and for example `git config user.email` will return one of the two email addresses, the one associated to the identity for this repo.

Based on that, we can use the `Match exec <cmd>` filtering directive in the `.ssh/config`, and write something like this:

```
Match host github.com exec "[ $(git config user.email) = nick@perso.org ]"
    IdentityFile ~/.ssh/perso_rsa

Host github.com
    IdentityFile ~/.ssh/pro_rsa
```

And just use the regular `git@github.com:user/project.git` for both identities.

It works as follows: When the host is `github.com`, the first matching rule is used to determine the `IdentityFile` to use. For the first rule, the `exec` command is run and the rule is selected if that command returns a zero exit status. Our test (passed to the user's shell) checks whether `git config user.email` returns `nick@perso.org`. If this is the case, the check returns true, the rule match, and `~/.ssh/perso_rsa` is picked. If not, the second rule acts as a catch-all for `github.com`, and `~/.ssh/pro_rsa` is picked instead.

We could have added another check for the second identity, but with only two rules it is not necessary, the “catch-all” behaviour should be enough.

We could also adapt the check to test other parameters insted of the `user.email` from git. For example, we could check the name of the current working directory. See `man ssh_config` for more details on `Match exec`.

Additional remarks (credits to Acumenus):

-   If supported by the user's shell (bash, zsh at least), double square brackets are necessary if part of the check (in our case, `$(git config user.email)`) evaluates to multiple words, as single brackets will [break](https://stackoverflow.com/questions/13781216). Ideally we would like to enquote that between double quotes, but they are used for the argument for `exec` already and I did not find a way to escape them.
-   With this setup, cloning new repositories through SSH will use the key associated to the default user email (first `user.email` entry in `git config -l`). To clone a repository with the other key, one solution is to first create the repository, then add a remote and pull: `mkdir foo; cd foo; git init; git config ...; git remote add origin <URL>; git pull`.
-   The catch-all rule is of course unnecessary if the file for the key is one that ssh looks for by default, such as `$HOME/.ssh/id_rsa`.
-   The `host` directive can be used to match several comma-separated hosts at once if necessary (`Match host github.com,gitlab.com exec ...`).
