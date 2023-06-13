---
title: 入門如何設定採用 Arch Custom Local Repository
nav_order: 1050
has_children: false
parent: Build ISO
grand_parent: ISO
---


## 入門如何設定採用 Arch Custom Local Repository


## Arch Wiki

* pacman / Tips and tricks / [Custom local repository](https://wiki.archlinux.org/title/Pacman/Tips_and_tricks#Custom_local_repository)
* pacman / Tips and tricks / [Installing packages from a CD/DVD or USB stick](https://wiki.archlinux.org/title/Pacman/Tips_and_tricks#Installing_packages_from_a_CD/DVD_or_USB_stick)


## 編輯「pacman.conf」


編輯「/etc/pacman.conf」，加入如下的內容

``` ini
[demo-os]
SigLevel = Optional TrustAll
#Server = file:///opt/demo-os/demo-repository/x86_64
Server = file:///opt/demo-os/demo-repository/$arch
```

## 更新「Repository DB Data」

執行

``` sh
sudo pacman -Sy
```

執行

``` sh
pacman -Sl demo-os 
```

顯示

```
demo-os demo-hello 0.1-1
```

## 安裝「demo-hello」

執行下面指令，安裝「demo-hello」

``` sh
sudo pacman -S demo-hello 
```


安裝完成後，執行下面指令

``` sh
pacman -Sl demo-os 
```

顯示

```
demo-os demo-hello 0.1-1 [installed]
```

執行下面指令

``` sh
pacman -Ql demo-hello
```

顯示

```
demo-hello /usr/
demo-hello /usr/bin/
demo-hello /usr/bin/demo-hello
demo-hello /usr/share/
demo-hello /usr/share/demo-hello/
demo-hello /usr/share/demo-hello/content.txt
```

執行下面指令

``` sh
pacman -Ql -q demo-hello
```

執行下面指令

``` sh
pacman -Qlq demo-hello
```

顯示

```
/usr/
/usr/bin/
/usr/bin/demo-hello
/usr/share/
/usr/share/demo-hello/
/usr/share/demo-hello/content.txt
```

執行下面指令

``` sh
pacman -Qi demo-hello
```

顯示

```
Name            : demo-hello
Version         : 0.1-1
Description     : Demo Hello Packaging
Architecture    : any
URL             : https://github.com/samwhelp/note-about-archlinux/tree/gh-pages/_demo/build-iso/demo-os/demo-packaging/demo-hello
Licenses        : MIT
Groups          : None
Provides        : demo-hello
Depends On      : None
Optional Deps   : None
Required By     : None
Optional For    : None
Conflicts With  : None
Replaces        : None
Installed Size  : 104.00 B
Packager        : Unknown Packager
Build Date      : Wed 06 Jul 2022 06:02:03 PM CST
Install Date    : Wed 06 Jul 2022 11:32:43 PM CST
Install Reason  : Explicitly installed
Install Script  : No
Validated By    : SHA-256 Sum
```
