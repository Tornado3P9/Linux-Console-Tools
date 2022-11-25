# wc

https://www.gnu.org/software/coreutils/wc

```bash
# Count all lines in a file:
wc --lines path/to/file
wc -l path/to/file

# Count all words in a file:
wc --words path/to/file
wc -w path/to/file

# Count all bytes in a file:
wc --bytes path/to/file
wc -c path/to/file

# Count all characters in a file (taking multi-byte characters into account):
wc --chars path/to/file
wc -m path/to/file

# Count the length of the longest line in number of characters:
wc --max-line-length path/to/file
wc -L path/to/file

# Count all lines, words and bytes from `stdin`:
find . | wc
```
