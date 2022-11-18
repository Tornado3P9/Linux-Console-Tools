## trash-cli

Stop accidently deleting valuable data with `rm -rf`!
```bash
sudo apt install trash-cli
```

https://github.com/andreafrancia/trash-cli.
```bash
# Trash files and directories:
trash-put filename

# Empty the trashcan:
trash-empty

# List trashed files:
trash-list

# Restore a trashed file by choosing a number from the list that results from this command:
trash-restore

# Remove individual files from the trashcan:
trash-rm filename
```

In order to prevent you from accidently using the old `rm` even though you installed `trash-cli` just create a new alias on the old command:
```bash
echo "alias rm='trash -v'" >> ~/.bash_aliases
source ~/.bashrc

# or as the creater recommands: alias rm='echo "This is not the command you are looking for."; false'
```

