## Hexdump

```bash
hexdump -C filename
```


## jeex

```bash
Usage:
  jeex [OPTION...] [FILE 1] [FILE 2] [...] [FILE 64]

Help Options:
  -h, --help
	Shows this help.
  -g, --help-gtk
	Shows the Gtk+ Options.

Jeex Options:
  -v, --version
	Shows the Jeex version.
  -b [FILE], --show-bytes [FILE]
	Shows the file's bytes.
  -s [FILE:type1,type2,...], --show-struct [FILE:type1,type2,...]
	Shows the file's portion.
  -p [FILE:start_byte,end_byte], --show-portion [FILE:start_byte,end_byte]
	Shows the file's data in structures with types specified.
```


## Hexcurse – Console Hex Editor

```bash
usage: hexcurse [-?|help] [-a] [-r rnum] [-o outputfile] [[-i] infile]

    -a		Output addresses in decimal format initially
    -e		Output characters in EBCDIC format rather than ASCII
    -r rnum	Resize the display to "rnum" bytes wide
    -o outfile	Write output to outfile by default
    -? | -help	Display usage and version of hexcurse program
    [-i] infile	Read from data from infile (-i required if not last argument)
```


## Xxd Hex Editor

```bash
xxd -h

Usage:
       xxd [options] [infile [outfile]]
    or
       xxd -r [-s [-]offset] [-c cols] [-ps] [infile [outfile]]
Options:
    -a          toggle autoskip: A single '*' replaces nul-lines. Default off.
    -b          binary digit dump (incompatible with -ps,-i,-r). Default hex.
    -C          capitalize variable names in C include file style (-i).
    -c cols     format <cols> octets per line. Default 16 (-i: 12, -ps: 30).
    -E          show characters in EBCDIC. Default ASCII.
    -e          little-endian dump (incompatible with -ps,-i,-r).
    -g          number of octets per group in normal output. Default 2 (-e: 4).
    -h          print this summary.
    -i          output in C include file style.
    -l len      stop after <len> octets.
    -o off      add <off> to the displayed file position.
    -ps         output in postscript plain hexdump style.
    -r          reverse operation: convert (or patch) hexdump into binary.
    -r -s off   revert with <off> added to file positions found in hexdump.
    -s [+][-]seek  start at <seek> bytes abs. (or +: rel.) infile offset.
    -u          use upper case hex letters.
    -v          show version: "xxd V1.10 27oct98 by Juergen Weigert".
```
Because on Linux, everything is a file, the mouse is too:
```bash
sudo xxd /dev/input/mouse0
```

