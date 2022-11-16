LXSplit v0.2.4 by Richard Stellingwerff, O. Sezer.  
Home page: http://lxsplit.sourceforge.net/

```bash
sudo apt install lxsplit
```

Usage: lxsplit [OPTION] [FILE] [SPLITSIZE]

Available options:  
 -j : join the files beginning with the given name  
 -s : split the given file.  requires a valid size  
Splitsize examples: 15M, 100m, 5000k, 30000000b

Examples:
```bash
lxsplit -s hugefile.bin 15M
lxsplit -j hugefile.bin.001
```
