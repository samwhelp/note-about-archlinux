

# Host Steps


## Subject

* [Package Required](README.packages.md)
* [Steps](README.steps.md)

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


run 

``` sh
sudo wipefs --all /dev/sdc
```
