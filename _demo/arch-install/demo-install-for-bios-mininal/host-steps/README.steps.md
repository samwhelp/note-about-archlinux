

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

or run

``` sh
sudo parted --script -- "/dev/sdc" \
	mktable gpt \
	mkpart primary 1M 2M \
	mkpart primary 2M '100%' \
	set 1 bios_grub on \
	print
```

show

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

> format partition

run

``` sh
sudo mkfs.ext4 "/dev/sdc2"
```

> show disk info

run

``` sh
sudo parted "/dev/sdc" print
```

show

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

or run

``` sh
sudo parted "/dev/sdc" print free
```

show

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

run

``` sh
sudo mount /dev/sdc2 /mnt
```


## Install Base System

run

``` sh
sudo pacstrap /mnt base linux
```


## Create fstab

run

``` sh
sudo sh -c "genfstab -U /mnt >> /mnt/etc/fstab"
```


## chroot

run

``` sh
sudo arch-chroot /mnt
```
