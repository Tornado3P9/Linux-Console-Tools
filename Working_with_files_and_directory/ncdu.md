# ncdu (NCurses Disk Usage)
is a disk utility for Unix systems designed to find space usage on a hard drive with an
ncurses-based interface. It provides a fast and easy-to-use interface to find the files and directories taking up
your disk space.

Here's a step-by-step guide on how to use ncdu:

1. **Installation**: If ncdu is not already installed, you can install it using your package manager. For Ubuntu, you would use:
   ```bash
   sudo apt update
   sudo apt install ncdu
   ```

2. **Running ncdu**: To start ncdu, simply type ncdu in your terminal. By default, it will scan the current directory and its subdirectories:
   ```bash
   ncdu
   ```

3. **Scanning a Specific Directory**: To scan a specific directory, provide the path as an argument:
   ```bash
   ncdu /path/to/directory
   ```

4. **Navigation**:
   - Use the arrow keys to navigate through the directories.
   - Enter to go into a directory.
   - `n` to sort by name (ascending/descending).
   - `s` to sort by size (ascending/descending).
   - `g` to toggle between showing percentages and graph.
   - `c` to toggle between showing items and cleaning up free space.
5. **Analyzing Results**: The interface will show you a list of files and directories, along with their sizes. The
   largest items will typically be at the top if you're sorting by size.
6. **Deleting Files**: If you find large files or directories you want to delete, you can do so directly from ncdu:
   - Select the file or directory with the arrow keys.
   - Press `d` to delete it.
   - Confirm the deletion.
     - Remember to be cautious when deleting files and directories, as ncdu will remove them immediately without moving them to a trash bin. Always double-check before confirming deletions.
7. **Exiting ncdu**: To exit `ncdu`, press `q`.
