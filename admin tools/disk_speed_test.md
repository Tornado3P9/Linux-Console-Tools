# [Disk Speed Test (Read/Write)](https://www.shellhacks.com/disk-speed-test-read-write-hdd-ssd-perfomance-linux/)

### dd: TEST Disk WRITE Speed

Run the following command to test the WRITE speed of a disk:
```bash
$ sync; dd if=/dev/zero of=tempfile bs=1M count=1024; sync
1024+0 records in
1024+0 records out
1073741824 bytes (1.1 GB) copied, 3.28696 s, 327 MB/s
```

### dd: TEST Disk READ Speed

Clear the cache and accurately measure the real READ speed directly from the disk:
```bash
$ sudo /sbin/sysctl -w vm.drop_caches=3
vm.drop_caches = 3
$ dd if=tempfile of=/dev/null bs=1M count=1024
1024+0 records in
1024+0 records out
1073741824 bytes (1.1 GB) copied, 2.27431 s, 472 MB/s
```

### dd: TEST Read/Write Speed of an External Drive

To check the performance of some External HDD, SSD, USB Flash Drive or any other removable device or remote file-system, simply access the mount point and repeat the above commands.  
Or you can replace tempfile with the path to your mount point e.g.:
```bash
$ sync; dd if=/dev/zero of=/media/user/MyUSB/tempfile bs=1M count=1024; sync
```

### hdparm: Test HDD, SSD, USB Flash Drive’s Performance

Run hdparm as follows, to measure the READ speed of a storage drive device /dev/sda:
```bash
$ sudo hdparm -Tt /dev/sda
/dev/sda:
 Timing cached reads:   16924 MB in  2.00 seconds = 8469.95 MB/sec
 Timing buffered disk reads: 1386 MB in  3.00 seconds = 461.50 MB/sec
```

### For Windows there is the grafical Version of CrystalDiskMark

https://crystaldiskmark.en.lo4d.com/windows


