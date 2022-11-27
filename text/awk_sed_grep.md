# Text manipulation

https://stackoverflow.com/questions/44877533/get-first-word-of-every-line-with-awk-or-sed  

Get first word of every line from a text file:
```bash
# Using awk: By setting number of fields to 1:
awk '{NF=1}1' inputfile   

# Using grep and look arounds:
grep -oP '^.[^ ]+' inputfile

# Using sed backrefrencing:
sed -r 's/(^.[^ ]+).*/\1/' inputfile
```

printing ASCII chars from a binary file
```bash
strings binary_file

sudo strings /dev/mem | less   # -> printing the computer memory
```

## awk

```bash
# The awk command offers a much simpler solution as compared to sed command. In this example, remove all empty lines using awk:
awk 'NF' my_input > my_output
```


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


## sed

https://www.systutorials.com/how-to-delete-a-specific-line-from-a-text-file-in-command-line-on-linux/  
https://www.cyberciti.biz/faq/using-sed-to-delete-empty-lines/  

Deleting a Specific Line From a Text File in Command Line in Linux:
```bash
# Remove the line matching by a regular expression REGULAR:
sed '/REGULAR/d' ./file

# For a simple example, remove the lines containing “oops”:
sed '/oops/d' ./file

# To delete all empty lines from a file called /tmp/data.txt, enter:
sed '/^$/d' /tmp/data.txt

# To store output to another file use redirection operator or pipe the output to 'tee' which displays the output at the same time:
sed '/^$/d' /tmp/data.txt > /tmp/output.txt
sed '/^$/d' /tmp/data.txt | tee /tmp/output.txt

# OR update the file using -i option:
sed -i '/^$/d' /tmp/data.txt 

# We type the following to change all occurrences of “day” to “week,” and give the mariner and albatross more time to bond:
sed -n 's/day/week/p' coleridge.txt
# In the first line, only the second occurrence of “day” is changed. This is because sed stops after the first match per line. We have to add a “g” at the end of the expression, as shown below, to perform a global search so all matches in each line are processed:
sed -n 's/day/week/gp' coleridge.txt
# This matches three out of the four in the first line. Because the first word is “Day,” and sed is case-sensitive, it doesn’t consider that instance to be the same as “day.”
# We type the following, adding an i to the command at the end of the expression to indicate case-insensitivity:
sed -n 's/day/week/gip' coleridge.txt
# This works, but you might not always want to turn on case-insensitivity for everything. In those instances, you can use a regex group to add pattern-specific case-insensitivity.
# For example, if we enclose characters in square brackets ([]), they’re interpreted as “any character from this list of characters.”
# We type the following, and include “D” and “d” in the group, to ensure it matches both “Day” and “day”:
sed -n 's/[Dd]ay/week/gp' coleridge.txt

## Exchange part of a string with another:
# change strings containing slashes
sed 's,{some_path},{other_path},'
# change strings not containing slashes
sed 's/find_string/exchange_with/g'

# another example:
#cat BBK.html | grep -Po '(?<=(LEFTSTRING)).*(?=(RIGHTSTRING))' | sed 's/tausch_das/mit_dem/g' > Database.csv
cat BBK.html | grep -Po '(?<=(        <DT><A HREF=)).*(?=(/A>))' | sed 's,^,./lzeditor -e ,' | sed 's/ target="_blank"/ /g' | sed 's/>/"/g' | sed 's/</" "BBK"/g' > BBK.txt
```
