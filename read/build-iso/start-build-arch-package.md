---
title: 入門如何製作 Arch Package
nav_order: 1030
has_children: false
parent: Build ISO
---


## 入門如何製作 Arch Package


## 範例

| 範例 |
| --- |
| [demo-hello](https://github.com/samwhelp/note-about-archlinux/tree/gh-pages/_demo/build-iso/demo-os/demo-packaging/demo-hello) |


## Arch Wiki

* [Creating packages](https://wiki.archlinux.org/title/Creating_packages) ([中文](https://wiki.archlinux.org/title/Creating_packages_(%E7%AE%80%E4%BD%93%E4%B8%AD%E6%96%87))))
* [PKGBUILD](https://wiki.archlinux.org/title/PKGBUILD)
* [makepkg](https://wiki.archlinux.org/title/makepkg)
* [pacman](https://wiki.archlinux.org/title/pacman)
* [Arch package guidelines](https://wiki.archlinux.org/title/Arch_package_guidelines)



## Howto

* [安裝 base-devel](安裝-base-devel)
* [準備內容檔案](準備內容檔案)
* [編寫 PKGBUILD](編寫-pkgbuild)
* [製作 Package](製作-package)


### 安裝 base-devel

執行下面指令，安裝「Package Group: [base-devel](https://archlinux.org/packages/extra/any/archiso/)」

``` sh
sudo pacman -Sy --needed base-devel
```

### 準備內容檔案

* [asset/overlay/usr/bin/demo-hello](https://github.com/samwhelp/note-about-archlinux/blob/gh-pages/_demo/build-iso/demo-os/demo-packaging/demo-hello/asset/overlay/usr/bin/demo-hello)
* [asset/overlay/usr/share/demo-hello/content.txt](https://github.com/samwhelp/note-about-archlinux/blob/gh-pages/_demo/build-iso/demo-os/demo-packaging/demo-hello/asset/overlay/usr/share/demo-hello/content.txt)


### 編寫 PKGBUILD

編寫一個檔案，檔名是「[PKGBUILD](https://github.com/samwhelp/note-about-archlinux/blob/gh-pages/_demo/build-iso/demo-os/demo-packaging/demo-hello/PKGBUILD)」


### 製作 Package

* man 8 [makepkg](https://man.archlinux.org/man/makepkg.8)

在「PKGBUILD」所在的資料夾，執行下面指令

``` sh
makepkg -sf
```

就會產生兩個資料夾

* src
* pkg

和一個檔案

* demo-hello-0.1-1-any.pkg.tar.zst




