# Multiple Python Versions in parallel

## Standard Repository
To use different Python versions on Xubuntu 20.04, you can follow these steps:

1. Check the available Python versions: 
   - Open a terminal.
   - Run the command `ls /usr/bin/python*` to see the installed Python versions.

2. Install the desired Python version:
   - Open a terminal.
   - Run the command `sudo apt update` to update the package list.
   - Run the command `sudo apt install python<version>` to install the desired Python version. For example, to install Python 3.8, you would run `sudo apt install python3.8`.

3. Verify the installation:
   - Open a terminal.
   - Run the command `python<version> --version` to verify that the correct Python version is installed. For example, to verify Python 3.8, you would run `python3.8 --version`.

4. Set the default Python version (optional):
   - Open a terminal.
   - Run the command `sudo update-alternatives --config python` to set the default Python version.
   - Select the desired Python version from the list and press Enter.

5. Use a specific Python version:
   - Open a terminal.
   - Run the command `python<version>` to use a specific Python version. For example, to use Python 3.8, you would run `python3.8`.

Note: Some Python versions may not be available in the default Ubuntu repositories. In such cases, you can use alternative methods like using a package manager like `pyenv` or manually installing from source.

## pyenv
With `pyenv`, you can install and manage different versions of Python, set a global Python version, and specify a Python version for a specific project. It also provides a plugin system that allows you to extend its functionality.

Here's an example of how `pyenv` can be used:

1. Install `pyenv`:
   ```bash
   $ git clone https://github.com/pyenv/pyenv.git ~/.pyenv
   $ echo 'export PYENV_ROOT="$HOME/.pyenv"' >> ~/.bashrc
   $ echo 'export PATH="$PYENV_ROOT/bin:$PATH"' >> ~/.bashrc
   $ echo 'eval "$(pyenv init --path)"' >> ~/.bashrc
   $ exec "$SHELL"
   ```

2. Install a specific Python version:
   ```bash
   $ pyenv install 3.9.7
   ```

3. Set a global Python version:
   ```bash
   $ pyenv global 3.9.7
   ```

4. Create a virtual environment with a specific Python version:
   ```bash
   $ pyenv virtualenv 3.9.7 myenv
   ```

5. Activate the virtual environment:
   ```bash
   $ pyenv activate myenv
   ```

6. Install packages within the virtual environment:
   ```bash
   $ pip install requests
   ```

7. Deactivate the virtual environment:
   ```bash
   $ pyenv deactivate
   ```

By using `pyenv`, you can easily manage different Python versions and create isolated environments for your projects, ensuring compatibility and flexibility.

## PPA
By installing new python versions via PPA you will get more choice but usually PPAs are seen as being less secure than the standard repository of your os.

If you still want to try it out, use:
```bash
sudo add-apt-repository ppa:deadsnakes/ppa -y
```

## Compile Python Yourself
By compiling the python version yourself you also get more room for customizations.
To use Python 3.12 in a local directory without installing it on your Linux system, you can follow these steps:

1. Download the Python 3.12 source code from the official Python website or using the following command:
   ```
   wget https://www.python.org/ftp/python/3.12.0/Python-3.12.0.tgz
   ```

2. Extract the downloaded source code using the following command:
   ```
   tar -xf Python-3.12.0.tgz
   ```

3. Navigate to the extracted directory:
   ```
   cd Python-3.12.0
   ```

4. Configure the build and specify the installation directory using the following command:
   ```
   ./configure --prefix=/path/to/installation/directory
   ```

   Replace "/path/to/installation/directory" with the actual path where you want to install Python 3.12.

5. Build Python using the following command:
   ```
   make
   ```

6. Install Python using the following command:
   ```
   make install
   ```

7. Now you can use Python 3.12 by specifying the full path to the Python executable in your local directory. For example:
   ```
   /path/to/installation/directory/bin/python3.12
   ```

   Replace "/path/to/installation/directory" with the actual path where you installed Python 3.12.

Note: This method installs Python 3.12 only in the specified directory and does not affect the system-wide Python installation.
