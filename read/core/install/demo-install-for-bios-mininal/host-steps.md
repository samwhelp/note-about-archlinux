---
title: Host Steps
nav_order: 1010
has_children: false
parent: Demo Install For Bios Mininal
grand_parent: 安裝
---


# Host Steps

* [Create Partition](#create-partition)
* [Mount Root Partition](#mount-root-partition)
* [Install Base System](#install-base-system)
* [Create fstab](#create-fstab)


## Create Partition

> create partition

run

``` sh
sudo parted --script "/dev/sdc" -- \
	mktable gpt \
	mkpart primary 1M 2M \
	mkpart primary 2M '-1' \
	set 1 bios_grub on \
	print
```

> format partition

run

``` sh
sudo mkfs.ext4 "/dev/sdc2"
```

> show table info

執行

``` sh
sudo parted "/dev/sdc" print
```

顯示

```
Model: Kingston DataTraveler 3.0 (scsi)
Disk /dev/sdc: 124GB
Sector size (logical/physical): 512B/512B
Partition Table: gpt
Disk Flags:

Number  Start   End     Size    File system  Name     Flags
 1      1049kB  2097kB  1049kB               primary  bios_grub
 2      2097kB  124GB   124GB   ext4         primary
```


## Mount Root Partition

執行下面指令，掛載要安裝的「Root 分割區 (/dev/sdc2)」，掛載到「/mnt」這個路徑。

``` sh
sudo mount /dev/sdc2 /mnt
```


## Install Base System

執行下面指令，安裝基本系統

``` sh
sudo pacstrap /mnt base linux
```


## Create fstab

執行下面指令，產生「fstab」。

``` sh
sudo sh -c "genfstab -U /mnt >> /mnt/etc/fstab"
```


## chroot

執行下面指令，進到「chroot」的環境

``` sh
sudo arch-chroot /mnt
```

> 接下來進到「chroot」的環境後的「[操作步驟](https://samwhelp.github.io/note-about-archlinux/read/core/install/demo-install-for-bios-mininal/chroot-steps.html)」。
