## user and hostname

```bash
# How can I get the current user's username in Bash?
whoami             # => user01
echo "$USER"       # => user01
id -u -n           # => user01

# To save these values to a variable, do

myvariable=$(whoami)
#or
myvariable=$USER
#or
myvariable=$(id -un)
#or
myvariable="My username is `id -un`"

# Of course, you don't need to make a variable since that is what the $USER variable is for.

# How can I get the current hostname in Bash?
hostname           # => host01
echo $HOSTNAME     # => host01

hs=`hostname`
echo $hs           # => host01

cat /proc/sys/kernel/hostname  # => host01
cat /etc/hostname  # => host01
```
