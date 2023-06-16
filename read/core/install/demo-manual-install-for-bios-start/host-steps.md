---
title: Host Steps
nav_order: 1010
has_children: false
parent: 手動安裝 Arch Linux 範例 / BIOS 開機
grand_parent: 安裝
---


# Host Steps

* [Create Partition](#create-partition)
* [Mount Root Partition](#mount-root-partition)
* [Install Base System](#install-base-system)
* [Create fstab](#create-fstab)


## Create Partition

執行下面指令，將「隨身碟2 (/dev/sdc)」做簡易的磁碟分割。

``` sh
sudo parted --script -- "/dev/sdc" \
	mktable gpt \
	mkpart primary 1M 2M \
	mkpart primary 2M '-1' \
	set 1 bios_grub on \
	print
```

或是執行下面的指令 (上面「-1」改成「100%」，同等效用)

``` sh
sudo parted --script -- "/dev/sdc" \
	mktable gpt \
	mkpart primary 1M 2M \
	mkpart primary 2M '100%' \
	set 1 bios_grub on \
	print
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
 2      2097kB  124GB   124GB                primary
```

執行下面指令，將「/dev/sdc2」這個「分割區」，格式化成「ext4」。

``` sh
sudo mkfs.ext4 "/dev/sdc2"
```

執行下面指令，再次觀看「/dev/sdc」的分割資訊

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

也可以執行下面指令，連同「Free Space」的部份顯示出來。

``` sh
sudo parted "/dev/sdc" print free
```

顯示

```
Model: Kingston DataTraveler 3.0 (scsi)
Disk /dev/sdc: 124GB
Sector size (logical/physical): 512B/512B
Partition Table: gpt
Disk Flags:

Number  Start   End     Size    File system  Name     Flags
        17.4kB  1049kB  1031kB  Free Space
 1      1049kB  2097kB  1049kB               primary  bios_grub
 2      2097kB  124GB   124GB   ext4         primary
        124GB   124GB   1032kB  Free Space
```


## Mount Root Partition

執行下面指令，掛載要安裝的「Root 分割區 (/dev/sdc2)」，掛載到「/mnt」這個路徑。

``` sh
sudo mount /dev/sdc2 /mnt
```


## Install Base System

執行下面指令，安裝基本系統到「/mnt」這個路徑。

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

> 接下來進到「chroot」的環境後的「[操作步驟](https://samwhelp.github.io/note-about-archlinux/read/core/install/demo-manual-install-for-bios-start/chroot-steps.html)」。
