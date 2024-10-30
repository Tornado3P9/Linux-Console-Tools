# readelf

readelf is a command-line utility for Unix and Unix-like systems that displays information about one or more **ELF (Executable and Linkable Format)** files.
ELF files are typically executables, object code, shared libraries, or core dumps.
readelf is used to inspect the internals of these files, such as their headers, sections, symbols, and other important data structures.  
More information: <https://manned.org/readelf.1>.  

```bash
# Display all information about the ELF file:
readelf -a|-all path/to/binary | less

# Display all the headers present in the ELF file:
readelf -e|--headers path/to/binary

# Display the entries in symbol table section of the ELF file, if it has one:
readelf -s|--symbols path/to/binary

# Display ELF header information:
readelf -h|--file-header path/to/binary

# Display ELF section header information:
readelf -S|--section-headers path/to/binary
```
