---
title: Download ISO
nav_order: 1000
has_children: false
parent: ISO
---


# Download ISO


## 下載腳本

* [下載腳本](https://github.com/samwhelp/note-about-grub/blob/gh-pages/_demo/prototype/boot_iso/demo_41_custom/ArchLinux/latest/iso/download.sh)


## 下載點

> 可以到「Arch / [Download](https://archlinux.org/download/)」找到下載點。

> 例如可以找到「[https://mirror.archlinux.tw/ArchLinux/iso/latest/](https://mirror.archlinux.tw/ArchLinux/iso/latest/)」。


## 下載方式一

> 透過「[curl](https://man.archlinux.org/man/curl.1.en)」這個指令來下載。

``` sh
curl -fLo ~/Downloads/iso/archlinux/archlinux-2023.06.01-x86_64.iso --create-dirs \
	https://mirror.archlinux.tw/ArchLinux/iso/latest/archlinux-2023.06.01-x86_64.iso
```

* Arch Wiki / [cURL](https://wiki.archlinux.org/title/CURL)


## 下載方式二

> 透過「[wget](https://man.archlinux.org/man/wget.1.en)」這個指令來下載。

``` sh
wget -c https://mirror.archlinux.tw/ArchLinux/iso/latest/archlinux-2023.06.01-x86_64.iso
```

或是執行下面指令

``` sh
wget -c https://mirror.archlinux.tw/ArchLinux/iso/latest/archlinux-2023.06.01-x86_64.iso -O archlinux-2023.06.01-x86_64.iso
```

> 關於「-c」指的是續傳

* Arch Wiki / [Wget](https://wiki.archlinux.org/title/Wget)


## 下載方式三

### iso-download.txt

先產生一個檔案「iso-download.txt」，內容如下

```
https://mirror.archlinux.tw/ArchLinux/iso/latest/archlinux-2023.06.01-x86_64.iso
```

### iso-download.sh

接著執行下面的指令，就會下載剛剛「iso-download.txt」裡面所列的檔案

``` sh
wget -c -i iso-download.txt
```

> 關於「-c」指的是續傳

> 關於「-i iso-download.txt」，指的是下載「iso-download.txt」裡面所列的檔案


## Boot ISO

> 接下來可以選擇不同的「[Boot ISO](https://samwhelp.github.io/note-about-archlinux/read/core/iso/boot-iso.html)」方式。
