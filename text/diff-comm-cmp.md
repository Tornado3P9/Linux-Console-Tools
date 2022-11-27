## diff - display the difference between two files

https://linuxhint.com/compare-two-files-linux/

```bash
# Show both files side by side (-y) with a width between the content of two files (-W)
diff -y -W 60 test_file_1.txt test_file_2.txt

#   | — Line is different in the second file
#   > — Line is additional in the second file
#   < — Line has been deleted from the second file

# To get separately and view the difference, use the following:
diff -y -W 60 --suppress-common-lines test_file_1.txt test_file_2.txt
```


## comm - compare two sorted files line by line 

https://linux.die.net/man/1/comm

```bash
# Show lines that only exist in file a: (i.e. what was deleted from a)
comm -23 a b

# Show lines that only exist in file b: (i.e. what was added to b)
comm -13 a b

# Show lines that only exist in one file or the other: (but not both)
comm -3 a b | sed 's/^\t//'
#(Warning: If file a has lines that start with TAB, it (the first TAB) will be removed from the output.)

# Do the same again with diff
# https://stackoverflow.com/questions/15384818/how-to-get-the-difference-only-additions-between-two-files-in-linux/15385080#15385080
diff \
  --new-line-format="%L" \
  --old-line-format="" \
  --unchanged-line-format="" \
  A1 A2
```


## cmp

https://www.linuxfordevices.com/tutorials/linux/cmp-command

Compare two files byte by byte.  

The optional SKIP1 and SKIP2 specify the number of bytes to skip  
at the beginning of each file (zero by default).  

Mandatory arguments to long options are mandatory for short options too.  
  -b, --print-bytes          print differing bytes  
  -i, --ignore-initial=SKIP         skip first SKIP bytes of both inputs  
  -i, --ignore-initial=SKIP1:SKIP2  skip first SKIP1 bytes of FILE1 and  
                                      first SKIP2 bytes of FILE2
  -l, --verbose              output byte numbers and differing byte values  
  -n, --bytes=LIMIT          compare at most LIMIT bytes  
  -s, --quiet, --silent      suppress all normal output  
      --help                 display this help and exit  
  -v, --version              output version information and exit  

SKIP values may be followed by the following multiplicative suffixes:  
kB 1000, K 1024, MB 1,000,000, M 1,048,576,  
GB 1,000,000,000, G 1,073,741,824, and so on for T, P, E, Z, Y.  

If a FILE is '-' or missing, read standard input.  
Exit status is 0 if inputs are the same, 1 if different, 2 if trouble.  

```bash
# Example:
cmp -s <(echo "hello") <(echo "helloworld"); echo $?
```
