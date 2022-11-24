# wc

https://www.gnu.org/software/coreutils/wc

```bash
# Print the number of lines in a file:
wc -l path/to/file

# Print the number of words in a file:
wc -w path/to/file

# Displays the count of bytes in a file:
wc -c path/to/file

# Print the count of characters from a file:
wc -m path/to/file

# Print only the length of the longest line in a file:
wc -L path/to/file

# Count all lines in a file:
wc --lines path/to/file

# Count all words in a file:
wc --words path/to/file

# Count all bytes in a file:
wc --bytes path/to/file

# Count all characters in a file (taking multi-byte characters into account):
wc --chars path/to/file

# Count all lines, words and bytes from `stdin`:
find . | wc

# Count the length of the longest line in number of characters:
wc --max-line-length path/to/file
```
