## Viewing files (cat, less, more, head, tail, headtail, watch)

```bash
# 1. meist ausreichend
cat ebook.txt

# 2. mehr ist immer gut
more ebook.txt

# 3. less is more and therefore king
less ebook.txt

# useful shortcuts:
# - Move forward one line: Down Arrow, Enter, e, or j
# - Move backward one line: Up Arrow, y, or k
# - Move forward one page: Space bar or Page Down
# - Move backward one page: Page Up or b
# - Scroll to the right: Right Arrow
# - Scroll to the left: Left Arrow
# - Jump to the top of the file: Home or g
# - Jump to the end of the file: End or G
# - Jump to a specific line: Type the line number and then hit “g”
# - Jump to a percentage way through the file: Type the percentage and then hit “p” or “%.”
#   (You can even enter decimal values, so to jump to the point 27.2 percent through the file,
#   type “27.2” and then hit “p” or “%.”  Why would you want to use decimals? I honestly have
#   no idea.)
# - Search forward: Hit “/” and type your search, like “/Jekyll”, and press Enter
# - Search backward: Hit “?” and type your search, like “/Hyde”, and press Enter
# - Next matching search item: n
# - Previous matching search item: N
# - Quit: q
```

cat
```bash
# displaying the contents of a file
cat filename

# displaying more files
cat filename1 filename2

# displaying the line numbers
cat -n filename

# concatenating 2 files
cat filename1 filename2 > filename3
```

less
```bash
# viewing a file using less
less filename

# less shortcuts:
# h         => getting help
# q         => quit
# enter     => show next line
# space     => show next screen
# /string   => search forward for a string
# ?string   => search backwards for a string
# n / N     => next/previous appearance
```

tail
```bash
# showing the last 10 lines of a file
tail filename

# showing the last 15 lines of a file
tail -n 15 filename

# showing the last lines of a file starting with line no. 15
tail -n +15 filename

# showing the last 10 lines of the file in real-time
tail -f filename

# deleting all lines but the last 10 in a file
echo "$(tail -n 10 test.log)" > test.log
# second version:
LOG=$(tail -n 10 test.log)
echo "$LOG" > test.log
```

head
```bash
# showing the first 10 lines of a file
head filename

# showing the first 15 lines of a file
head -n 15 filename
```

https://github.com/CleanCut/headtail
```bash
# Use it on a file - prints the first 10 and last 10 lines
headtail somebigfile.txt

# Pipe stdout to it - prints the first 10 and last 10 lines
somecommand | headtail

# Print the first 25 and last 5 lines of a file
headtail somebigfile.txt -H 25 -T 5

# Print the default amount of first lines, but only 3 last lines
headtail somebigfile.txt -T 3

# Do the default thing...but then keep tailing the file and print
# out anything new that is appended to it.
headtail somebigfile.txt -f
```

watch
```bash
# running repeatedly a command with refresh of 3 seconds
watch -n 3 ls -l
```

