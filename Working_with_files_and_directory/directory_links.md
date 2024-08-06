### How to create a link to every file or directory in the ***$HOME*** directory after you moved all files from ***$HOME*** to an extern drive:

This function loops over each item in the **`/mnt/external_drive/user`** directory and creates a symbolic link in **`/home/user`** with the same name as the original file or directory. Make sure to replace **`/mnt/external_drive`** with the actual mount point of your external drive.

```bash
# Function to create symbolic links for directories
link_dirs() {
  for dir in /mnt/external_drive/user/*; do
    if [ -d "$dir" ]; then
      ln -s "$dir" "/home/$USER/$(basename "$dir")"
    fi
  done
}

# Function to create symbolic links for files
link_files() {
  for file in /mnt/external_drive/user/*; do
    if [ -f "$file" ]; then
      ln -s "$file" "/home/$USER/$(basename "$file")"
    fi
  done
}

# Function to create symbolic links for both files and directories
link_all() {
  for item in /mnt/external_drive/user/*; do
    ln -s "$item" "/home/$USER/$(basename "$item")"
  done
}
```
