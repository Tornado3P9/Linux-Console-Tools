To grab the graphics driver version on a Linux/Ubuntu system, you can use the **`lshw`** command with **`grep`** to filter the output. Here's how you can do it for an NVIDIA or AMD/ATI graphics card:

For NVIDIA cards:
```bash
nvidia-smi | grep "Driver Version"
```

For AMD/ATI cards:
```bash
lshw -c video | grep 'configuration' | awk '{print $2}'
amdconfig
amdgpu
```

For Intel integrated graphics, you can use:
```bash
glxinfo | grep 'OpenGL version'
```

Apart from that you can also try:
```bash
lspci | grep NVIDIA

lspci | grep Magewell

lspci -nnk | grep -A3 "\[03..\]:"

hwinfo --gfxcard

ubuntu-drivers devices
```

Make sure you have the necessary tools installed (**`nvidia-smi`** for NVIDIA, **`lshw`** for general hardware listing, and **`mesa-utils`** for **`glxinfo`**). If **`glxinfo`** is not installed, you can install it using:
```bash
sudo apt install mesa-utils
```

