## lsmod
program to show the status of modules in the Linux Kernel  
https://manpages.ubuntu.com/manpages/precise/en/man8/lsmod.8.html  

```bash
lsmod | grep kvm
# kvm_intel             204800  6
# kvm                   593920  1 kvm_intel
# irqbypass              16384  1 kvm
```
