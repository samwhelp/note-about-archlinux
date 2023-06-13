---
title: Demo Install For Bios Mininal
nav_order: 1010
has_children: true
parent: 安裝
---


# Demo Install For Bios Mininal


## 前提

此範例有兩個「USB隨身碟」，

關於「隨身碟1 (/dev/sdb)」已經安裝了「Archlinux」，會先透過「隨身碟1 (/dev/sdb)」開機，並且已經連上網路了。

然後要將「新的Archlinux」安裝在「隨身碟2 (/dev/sdc)」。


## 所需「Package」

在「隨身碟1 (/dev/sdb)」需要有安裝以下「Package」

* [arch-install-scripts](https://archlinux.org/packages/extra/any/arch-install-scripts/)
* [parted](https://archlinux.org/packages/extra/x86_64/parted/)

``` sh
sudo pacman -Sy --needed arch-install-scripts parted
```


## 會使用到的指令


### arch-install-scripts

* [arch-chroot](https://man.archlinux.org/man/extra/arch-install-scripts/arch-chroot.8.en)
* [genfstab](https://man.archlinux.org/man/extra/arch-install-scripts/genfstab.8.en)
* [pacstrap](https://man.archlinux.org/man/pacstrap.8)

### parted

* [parted](https://man.archlinux.org/man/parted.8.en)


## 範例專案

* [demo-install-for-bios-mininal](https://github.com/samwhelp/note-about-archlinux/tree/gh-pages/_demo/arch-install/demo-install-for-bios-mininal)


## 操作步驟

| 中文說明 | 英文說明
| --- | --- |
| [Host Steps](https://samwhelp.github.io/note-about-archlinux/read/core/install/demo-install-for-bios-mininal/host-steps.html) | [Host Steps](https://github.com/samwhelp/note-about-archlinux/blob/gh-pages/_demo/arch-install/demo-install-for-bios-mininal/host-steps/README.steps.md) |
| [Chroot Steps](https://samwhelp.github.io/note-about-archlinux/read/core/install/demo-install-for-bios-mininal/chroot-steps.html) | [Chroot Steps](https://github.com/samwhelp/note-about-archlinux/blob/gh-pages/_demo/arch-install/demo-install-for-bios-mininal/chroot-steps/README.steps.md) |


## Arch Wiki

* [Installation guide](https://wiki.archlinux.org/title/installation_guide)
* [chroot](https://wiki.archlinux.org/title/chroot)
* [Pacstrap](https://wiki.archlinux.org/title/Pacstrap)
* [Parted](https://wiki.archlinux.org/title/Parted)
* [Archiso](https://wiki.archlinux.org/title/archiso)


## See Also

* Gitlab / [archiso](https://gitlab.archlinux.org/archlinux/archiso) / [mkarchiso](https://gitlab.archlinux.org/archlinux/archiso/-/blob/master/archiso/mkarchiso)
