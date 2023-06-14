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
curl -fLo ~/Downloads/iso/archlinux/archlinux-x86_64.iso --create-dirs \
	https://mirror.archlinux.tw/ArchLinux/iso/latest/archlinux-x86_64.iso
```

* Arch Wiki / [cURL](https://wiki.archlinux.org/title/CURL)


## 下載方式二

> 透過「[wget](https://man.archlinux.org/man/wget.1.en)」這個指令來下載。

``` sh
wget -c https://mirror.archlinux.tw/ArchLinux/iso/latest/archlinux-x86_64.iso
```

或是執行下面指令

``` sh
wget -c https://mirror.archlinux.tw/ArchLinux/iso/latest/archlinux-x86_64.iso -O archlinux-x86_64.iso
```

> 關於「-c」指的是續傳

* Arch Wiki / [Wget](https://wiki.archlinux.org/title/Wget)


## 下載方式三

### iso-download.txt

先產生一個檔案「iso-download.txt」，內容如下

```
https://mirror.archlinux.tw/ArchLinux/iso/latest/archlinux-x86_64.iso
```

### iso-download.sh

接著執行下面的指令，就會下載剛剛「iso-download.txt」裡面所列的檔案

``` sh
wget -c -i iso-download.txt
```

> 關於「-c」指的是續傳

> 關於「-i iso-download.txt」，指的是下載「iso-download.txt」裡面所列的檔案


## Boot ISO

> 簡單「[驗證](#驗證)」過「下載完成的ISO檔案」，接下來可以選擇不同的「[Boot ISO](https://samwhelp.github.io/note-about-archlinux/read/core/iso/boot-iso.html)」方式。


## 驗證

> 以下是一些驗證的參考指令


### gpg

* man [gpg](https://man.archlinux.org/man/gpg.1.en)
* Arch Wiki / [GnuPG](https://wiki.archlinux.org/title/GnuPG)

執行

``` sh
wget -c https://mirror.archlinux.tw/ArchLinux/iso/latest/archlinux-x86_64.iso.sig

gpg --keyserver-options auto-key-retrieve --verify archlinux-x86_64.iso.sig
```


### sha256sum

* man [sha256sum](https://man.archlinux.org/man/sha256sum.1)

執行

``` sh
wget -c https://mirror.archlinux.tw/ArchLinux/iso/latest/sha256sums.txt

sha256sum -c sha256sums.txt
```

會看到其中有一行

```
archlinux-x86_64.iso: OK
```

### b2sum

* man [b2sum](https://man.archlinux.org/man/b2sum.1)

執行

``` sh
wget -c https://mirror.archlinux.tw/ArchLinux/iso/latest/b2sums.txt

b2sum -c sha256sums.txt
```
