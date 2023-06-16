

# Host Steps


## Subject

* [Package Required](README.packages.md)
* [Steps](README.steps.md)

## Usage


### make-sys

``` sh
./build.sh
```

``` sh
THE_DEFAULT_RUN=make-sys ./build.sh
```

### make-profile

``` sh
THE_DEFAULT_RUN=make-profile ./build.sh
```


## TODO

* mkarchsys


## Log

```
warning: directory permissions differ on /mnt/etc/sudoers.d/
filesystem: 755  package: 750
```


## Issue / how to remove 'iso9660' signature

run

``` sh
sudo fdisk /dev/sdc
```

show

```
Welcome to fdisk (util-linux 2.39-dirty).
Changes will remain in memory only, until you decide to write them.
Be careful before using the write command.

This disk is currently in use - repartitioning is probably a bad idea.
It's recommended to umount all file systems, and swapoff all swap
partitions on this disk.

The device contains 'iso9660' signature and it will be removed by a write command. See fdisk(8) man page and --wipe option for more details.

Command (m for help):
```


* [How to remove iso 9660 from USB?](https://superuser.com/questions/14860/how-to-remove-iso-9660-from-usb)


### Way 001

run 

``` sh
sudo wipefs --all /dev/sdc
```

### Way 002

run

``` sh
sudo mkdosfs -I /dev/sdc

```

### Way 003

``` sh
sudo dd if=/dev/zero of=/dev/sdc
```

``` sh
sudo dd if=/dev/zero of=/dev/sdc bs=512 count=1
```

``` sh
sudo dd if=/dev/zero of=/dev/sdc bs=4M status=progress && sync
```



