### How to create a link to every file or directory in the ***$HOME*** directory after you moved all files from ***$HOME*** to an extern drive:

```bash
for item in /mnt/external_drive/$USER/*; do
    ln -s "$item" "/home/$USER/$(basename "$item")"
done
```

This script loops over each item in the **`/mnt/external_drive/user`** directory and creates a symbolic link in **`/home/user`** with the same name as the original file or directory. Make sure to replace **`/mnt/external_drive`** with the actual mount point of your external drive.

### To create an alias function in `~/.bashrc` for adding items from the current directory (`.`)

```bash
# Function to create symbolic links for directories
link_dirs() {
  for dir in ./*; do
    if [ -d "$dir" ]; then
      ln -s "$dir" "/home/$USER/$(basename "$dir")"
    fi
  done
}

# Function to create symbolic links for directories
link_files() {
  for file in ./*; do
    if [ -f "$file" ]; then
      ln -s "$file" "/home/$USER/$(basename "$file")"
    fi
  done
}

# Function to create symbolic links for both files and directories
link_all() {
  for item in ./*; do
    ln -s "$item" "/home/$USER/$(basename "$item")"
  done
}

# Wrapper function for alias
link_external() {
  if [ "$1" == "-d" ]; then
    link_dirs
  elif [ "$1" == "-f" ]; then
    link_files
  else
    link_all
  fi
}

# Alias for the link_external function
alias linkext='link_external'
```

Now, you can use the linkext alias in your terminal to run the script. For example:

```bash
# To link all files and directories:
linkext

# To link only directories:
linkext -d

# To link only files:
linkext -f

# But ofcourse directly calling the functions also works
link_files
```
