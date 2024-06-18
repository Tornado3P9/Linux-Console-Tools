# Text manipulation

Get first word of every line from a text file:  
Version 1: https://stackoverflow.com/questions/44877533/get-first-word-of-every-line-with-awk-or-sed
```bash
# Using awk: By setting number of fields to 1:
awk '{NF=1}1' inputfile   

# Using grep and look arounds:
grep -oP '^.[^ ]+' inputfile

# Using sed backrefrencing:
sed -r 's/(^.[^ ]+).*/\1/' inputfile
```

Version 2: https://stackoverflow.com/questions/16040567/use-awk-to-extract-substring
```bash
# You just want to set the field separator as . using the -F option and print the first field:
echo aaa0.bbb.ccc | awk -F'.' '{print $1}'

# Same thing but using cut:
echo aaa0.bbb.ccc | cut -d'.' -f1

# Or with sed:
echo aaa0.bbb.ccc | sed 's/[.].*//'
echo aaa0.bbb.ccc | sed 's/\..*//'

# Even grep:
echo aaa0.bbb.ccc | grep -o '^[^.]*'
```

printing ASCII chars from a binary file
```bash
strings binary_file

sudo strings /dev/mem | less   # -> printing the computer memory
```

## awk

```bash
# Remove all empty lines:
awk 'NF' my_input > my_output
```

```bash
# Skip first two fields and print the rest. https://www.cyberciti.biz/faq/unix-linux-bsd-appleosx-skip-fields-command/
# You can specify the input field separator too. In this example use ‘:’ as the input field separator:
awk -F':' '{ $1=""; $2=""; print}' filename
```

### [AWK split file on pattern and name new files after string in first line after pattern](https://askubuntu.com/questions/1176043/awk-split-file-on-pattern-and-name-new-files-after-string-in-first-line-after-pa)  
Starting from the file `example_file.txt` containing:
```bash
sdk,jalxa,9325
m,head1,3
ae,wea,2232
ax1,awq,2321
m,head1,32
dgf,12a,8923
m,head1,11
bsda,awq,902
9as,wea,1732
ax1,awq,2321
```

execute:
```bash
awk -F, '
  /^m,head/ {
    tmp = $0; getline; outfile = "file_" $2 ".txt"; print tmp > outfile
  } 
  outfile != "" {
    print > outfile
  }
' example_file.txt
```
(You can read in the next line in awk using [getline](https://www.gnu.org/software/gawk/manual/html_node/Getline.html))

result `head file_*.txt`:
```bash
==> file_12a.txt <==
m,head1,32
dgf,12a,8923

==> file_awq.txt <==
m,head1,11
bsda,awq,902
9as,wea,1732
ax1,awq,2321

==> file_wea.txt <==
m,head1,3
ae,wea,2232
ax1,awq,2321
```
If the filenames are not unique, you will probably want to append (`>>`) rather than truncate (`>`).

If you want to `gzip` the chunks, then rather than creating plain text files and then executing `gzip` via a `system` call, you can print data via standard input to `gzip` as follows
- taking care that you are [Closing Input and Output Redirections](https://www.gnu.org/software/gawk/manual/html_node/Close-Files-And-Pipes.html#Close-Files-And-Pipes)
```bash
awk -F, '
  /^m,head/ {
    close("gzip >" outfile); 
    tmp = $0; getline; outfile = "file_" $2 ".txt.gz"; print tmp | "gzip >" outfile
  } 
  outfile != "" {
    print | "gzip >" outfile
  } 
  END {
    close("gzip >" outfile)
  }
' example_file.txt
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
sed 's/some_string/exchange_with/g'
# change strings to line breaks
sed 's/some_string/&\'$'\n''/g' file
# change each occurrence of 'abc' in a file to '.' (you can omit the -i option to print the results to the terminal)
sed -i 's/abc/./g' filename.txt
sed -i 's|/media/user/data|.|g' example.txt

# another example:
#cat BBK.html | grep -Po '(?<=(LEFTSTRING)).*(?=(RIGHTSTRING))' | sed 's/tausch_das/mit_dem/g' > Database.csv
cat BBK.html | grep -Po '(?<=(        <DT><A HREF=)).*(?=(/A>))' | sed 's,^,./lzeditor -e ,' | sed 's/ target="_blank"/ /g' | sed 's/>/"/g' | sed 's/</" "BBK"/g' > BBK.txt

# count number of occurances of a certain character(") in each line
sed 's/[^"]//g' dat | awk '{ print length }'
```

