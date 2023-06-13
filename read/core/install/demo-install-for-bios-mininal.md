---
title: Demo Install For Bios Mininal
nav_order: 1010
has_children: true
parent: 安裝
---


# Demo Install For Bios Mininal


## 前提

此範例有兩個「USB隨身碟」，

關於「隨身碟1 (/dev/sdb)」已經安裝了「Archlinux」，會先透過「隨身碟1 (/dev/sdb)」開機。

然後要將「新的Archlinux」安裝在「隨身碟2 (/dev/sdc)」。


## 所需「Package」

在「隨身碟1 (/dev/sdb)」需要有安裝以下「Package」

* [arch-install-scripts](https://archlinux.org/packages/extra/any/arch-install-scripts/)
* [parted](https://archlinux.org/packages/extra/x86_64/parted/)

``` sh
sudo pacman -Sy --needed arch-install-scripts parted
```


## 範例專案

* [demo-install-for-bios-mininal](https://github.com/samwhelp/note-about-archlinux/tree/gh-pages/_demo/arch-install/demo-install-for-bios-mininal)


## 操作步驟

| 中文說明 | 英文說明
| --- | --- |
| [Host Steps](https://samwhelp.github.io/note-about-archlinux/read/core/install/demo-install-for-bios-mininal/host-steps.html) | [Host Steps](https://github.com/samwhelp/note-about-archlinux/blob/gh-pages/_demo/arch-install/demo-install-for-bios-mininal/host-steps/README.steps.md) |
| [Chroot Steps](https://samwhelp.github.io/note-about-archlinux/read/core/install/demo-install-for-bios-mininal/chroot-steps.html) | [Chroot Steps](https://github.com/samwhelp/note-about-archlinux/blob/gh-pages/_demo/arch-install/demo-install-for-bios-mininal/chroot-steps/README.steps.md) |

