## time

How long does `apt update` take?
```bash
time sudo apt update
```

How long `ls`?
```bash
time ls
```

How long does the md5sum program take
```bash
dd if=/dev/urandom of=testfile bs=1M count=100
time md5sum testfile > /dev/null
```
