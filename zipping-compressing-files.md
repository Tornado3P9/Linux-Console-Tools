https://linuxize.com/post/how-to-create-and-extract-archives-using-the-tar-command-in-linux/

#### zip
```bash
zip file
zip -r archive-name.zip directory_name
zip -r archive-name.zip folder1 folder2 file1.txt file2.txt
zip -e archive-name.zip directory_name  # encrypt with a password
unzip file.zip
unzip archive-name.zip -d /path/to/directory
unzip -l compressed.zip  # List files within a specified archive (without extracting them)
zip -sf compressed.zip   # List files within a specified archive (without extracting them)
```

#### xz
```bash
# Create the archive. The -k option keeps the original file; without this option the original file is removed after the process.
xz -k file      (xz -v -k \--threads=0 image.img) (compress multiple files: 'xz file1.txt file2.txt')

# Decompress it
xz -d file.xz
unxz file.xz

# List/show information about the compressed file
xz -l file.xz
```

#### gz
```bash
gzip -9 file
gzip -d file.gz (gunzip file.gz)
```

#### tar
```bash
#Create without compression
tar -cf archive.tar file1 file2 file3
tar -cvf backup.tar /home/user

#Create/Compress
tar -czf archive-name.tar.gz file1 file2...
    -c   # instructs tar to create a new archive.
    -z   # sets the compression method to gzip.
    file1 file2 ... # a space-separated list of files and directories to be added to the archive.

#Extract
tar -xvzf file.tar.gz
    -z   # Uses gzip, omit this if you just have a .tar
tar -xvf archive.tar.xz -C /remote/directory/
    -C   # Extract a tar file into another directory
tar -xvjf archive.tar.bz2
    -x, --extract, --get # extract files from an archive
    -f, --file=ARCHIVE   # specify the use of archive file to extract (--file=archive.tar.gz)
    -v, --verbose        # enables verbose mode, showing the progress of the command
    -j, --bzip2          # filter the archive through bzip2 compression

#List
tar -tzf archive.tar.gz
    -t, --list                # list the content of an archive
tar -tvf archive.tar.xz
tar -tf archive.tar | wc -l   # (list number of files in archive) list the content of an archive and pipe '|' it into wordcount 'wc' to count the number of lines '-l'

#Add
tar -rf archive.tar file.txt  # add `file.txt` to an existing tar archive
```

#### rar
```bash
rar file
unrar x file.rar
unrar l file.rar   # show information about the RAR archive without extracting any files
```

#### 7z
```bash
# sudo apt install p7zip-full
7z l file.zip   # list file content
```
