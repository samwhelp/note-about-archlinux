---
title: Chroot Steps
nav_order: 1020
has_children: false
parent: 手動安裝 Arch Linux 範例 / BIOS 開機
grand_parent: 安裝
---


# Chroot Steps

* [Install Grub](#install-grub)
* [Change Root User Password](#change-root-user-password)


## Install Grub

install package [grub-bios](https://archlinux.org/packages/core/x86_64/grub/) and [os-prober](https://archlinux.org/packages/extra/x86_64/os-prober/)

``` sh
pacman -S grub-bios os-prober
```

install grub to **/dev/sdc**

``` sh
grub-install /dev/sdc
```

create **/boot/grub/grub.cfg**

```
grub-mkconfig -o /boot/grub/grub.cfg
```


## Change Root User Password

``` sh
passwd
```
