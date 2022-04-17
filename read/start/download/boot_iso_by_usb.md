---
title: Boot ISO By USB
nav_order: 7020
has_children: false
parent: 下載
grand_parent: 入門
---


# Boot ISO By USB

## 操作步驟

先在「Arch Linux / [Download](https://archlinux.org/download/)」，

找到「[最新的ISO檔案下載網址](https://mirror.archlinux.tw/ArchLinux/iso/latest/)」，

假設下載「[archlinux-2022.04.05-x86_64.iso](https://mirror.archlinux.tw/ArchLinux/iso/2022.04.05/archlinux-2022.04.05-x86_64.iso)」

先執行下面指令，找到「USB隨身碟」的「Device代號」

``` sh
lsblk
```

假設是「/dev/sdb」

接著執行下面指令，就會寫入「USB隨身碟」。

``` sh
sudo dd if=./archlinux-2022.04.05-x86_64.iso of=/dev/sdb bs=4M status=progress && sync
```

接著重新開機，在「BIOS」選擇使用「該USB隨身碟」開機。


## 範例腳本

* [iso-to-usb.sh](https://github.com/samwhelp/note-about-grub/blob/gh-pages/_demo/prototype/boot_iso/demo_41_custom/ArchLinux/latest/iso/iso-to-usb.sh)
