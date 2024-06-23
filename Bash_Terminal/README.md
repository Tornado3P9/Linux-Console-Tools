# Bash Terminal
Tipp: Try [McFly - fly through your shell history](https://github.com/cantino/mcfly)  
Tipp: [18 Commands That Will Change The Way You Use Linux Forever](https://youtu.be/AVXYq8aL47Q)  
Tipp: https://github.com/ChrisTitusTech/mybash/blob/main/.bashrc

Which Console Type are you using? Type `echo $SHELL` to find out.  

Use the `Arrow Keys`, the `Page Up` and `Page Down` keys and the `Home` and `End` keys for maneuvering  
Also try holding the `Strg` key while using the `Arrow Keys`.  

`Strg+w` to delete a word and `Strg+u` to delete a whole line  
`Strg+a` to jump the beginning of a line and `Strg+e` to jump to the end of a line. Just typing the `Home` and `End` keys will also do the job.

### [Sending a job to the background](https://superuser.com/questions/83220/how-to-bring-a-background-job-to-foreground)
`Strg+z` or `bg` to send a running foreground job (maybe your text editor) to the background, `fg` to send it back to the foreground  

`jobs` to get a list of all the stopped jobs and background jobs  
Example:
```
jobs

[1]    suspended  top
[2]  - suspended  top
[3]  + suspended  top
```
`fg %2` or `fg 2` to send the number 2 background job to the foreground again  
`htop &` to send the program 'htop' to the background immediately

**https://linuxconfig.org/detach-process-program-from-current-shell-to-keep-it-alive-after-logout**

### [Different ways to execute a shell script](https://unix.stackexchange.com/questions/2976/different-ways-to-execute-a-shell-script)
```
/path/to/script # using the path (absolute or relative)
. script        # using the . (dot)
source script   # using the `source` command
```
Another way is by calling the interpreter and passing the path to the script to it:

```
/bin/sh /path/to/script
```
The dot and source are fairly similar, but "." only works in bash related shells, where "source" works in both  
bash and csh related shells. They execute the script in-place (as if you copied and pasted the script right there).  
This means that any functions and non-local variables in the script remain. It also means if the  
script does a cd into a directory, you'll still be there when its done.  

The other ways of running a script will run it in its own subshell. Variables in the script are not still  
alive when it's done. If the script changed directories, then it doesn't affect the calling environment.  

/path/to/script and /bin/sh script are slightly different. Typically, a script has a "shebang" at the  
beginning that looks like this:
```
#! /bin/bash
```
This is the path to the script interpreter. If it specifies a different interpreter than you do when you  
execute it, then it may behave differently (or may not work at all).  

For example, Perl scripts and Ruby scripts begin with (respectively):
```
#! /bin/perl
```
and
```
#! /bin/ruby
```
or
```
#!/bin/python3
# /bin/ is a directory link to /usr/bin/ so using one or the other should not make any difference!
```

[link](https://stackoverflow.com/questions/12691461/exactly-what-does-env-do-in-bash)  
Commonly, `env` is also used in the hash-bang lines of scripts that strive to be portable.
The reason being that `env` is nearly always at `/usr/bin/env`, while bash isn't always at `/bin/bash` as many a hash-bang line implies.
Example:
```bash
#!/usr/bin/env bash
```
also works for other programs/interpreters:
```bash
#!/usr/bin/env python
```

If you execute one of those scripts by running `/bin/sh script`, then they will not work at all.  

Ubuntu does use the bash shell, the point is that `sh` corresponds to `dash`, but not to `bash`.  
Scripts that require bash may work slightly wrong when called by doing `/bin/sh script` because  
you've just called a bash script using the dash interpreter.  

Another small difference between calling the script directly and passing the script path to the  
interpreter is that the script must be marked executable `chmod +x script` to run it directly,  
but not to run it by passing the path to the interpreter.  

Another minor variation: you can prefix any of these ways to execute a script with eval, so, you can have
```
eval sh script
eval script
eval . script
```
and so on.
