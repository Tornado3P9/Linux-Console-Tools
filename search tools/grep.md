## grep

Example: `grep -i 'hello world' menu.h main.c`

Find All Normal Email Addresses in a File:
```bash
grep -E -o "\b[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,6}\b" filename.txt
```

give the 'grep' command some color
```bash
grep --color=always  abc  a_file.txt

#There are 3 color options available to you:
#    --color=auto
#    --color=always
#    --color=never
#With color=always, it colors the matched string. Edit the line in .bashrc to make the change permanent!
```

If you use the grep command without any option, you need to use `\|` to separate multiple patterns for the or condition. https://www.thegeekstuff.com/2011/10/grep-or-and-not-operators/
```bash
grep 'pattern1\|pattern2' filename
```

Look for two different strings by using `|` (pipe OR operator)
```bash
grep -E 'Fds|UTR' file

# or

grep -E '(Fds|UTR)' file

# or

grep -P '(?:Fds|UTR)' file

# or

grep 'Fds\|UTR' file
```

Exchange part of a string with another:
```bash
#change strings containing slashes
sed 's,{some_path},{other_path},'
#change strings not containing slashes
sed 's/tausch_das/mit_dem/g'
```

Just a bigger example:
```bash
#cat BBK.html | grep -Po '(?<=(LEFTSTRING)).*(?=(RIGHTSTRING))' | sed 's/tausch_das/mit_dem/g' > Database.csv
cat BBK.html | grep -Po '(?<=(        <DT><A HREF=)).*(?=(/A>))' | sed 's,^,./lzeditor -e ,' | sed 's/ target="_blank"/ /g' | sed 's/>/"/g' | sed 's/</" "BBK"/g' > BBK.txt
```

printing ASCII chars from a binary file
```bash
strings binary_file

sudo strings /dev/mem | less   # -> printing the computer memory
```
