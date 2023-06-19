---
title: 在製作 Arch ISO 時，如何設定採用 Arch Custom Local Repository
nav_order: 1060
has_children: false
parent: Build ISO
grand_parent: ISO
---


## 在製作 Arch ISO 時，如何設定採用 Arch Custom Local Repository


## 前提

延續之前的「[入門如何製作 Arch ISO](https://samwhelp.github.io/note-about-archlinux/read/core/iso/build-iso/start-build-arch-iso.html)」，

這裡要說明在製作 Arch ISO 時，如何設定採用「Arch Custom Local Repository」。


## 範例

| 範例 |
| --- |
| [demo-use-custom-local-repository](https://github.com/samwhelp/note-about-archlinux/tree/gh-pages/_demo/iso/build-iso/demo-os/demo-iso-profile/demo-use-custom-local-repository) |


## Arch Wiki

* pacman / Tips and tricks / [Custom local repository](https://wiki.archlinux.org/title/Pacman/Tips_and_tricks#Custom_local_repository)
* pacman / Tips and tricks / [Installing packages from a CD/DVD or USB stick](https://wiki.archlinux.org/title/Pacman/Tips_and_tricks#Installing_packages_from_a_CD/DVD_or_USB_stick)


## Howto

* [編輯「profile/pacman.conf」](#編輯profilepacmanconf」)
* [編輯「profile/packages.x86_64」](#編輯profilepackagesx86_64」)
* [製作 iso](#製作-iso)


## 編輯「profile/pacman.conf」

對照「[入門如何設定採用 Arch Custom Local Repository ](https://samwhelp.github.io/note-about-archlinux/read/core/iso/build-iso/start-use-custom-local-repository.html)」這篇提到的，

設定採用「Arch Custom Local Repository」，是編輯「/etc/pacman.conf」。

然而這篇是要在製作 Arch ISO 時，採用「Arch Custom Local Repository」，

所以要編輯「[profile/pacman.conf](https://github.com/samwhelp/note-about-archlinux/blob/gh-pages/_demo/build-iso/demo-os/demo-iso-profile/demo-use-custom-local-repository/profile/pacman.conf#L110)」，加入如下的內容

``` ini
[demo-os]
SigLevel = Optional TrustAll
Server = file:///opt/demo-os/demo-repository/$arch
#Server = file:///opt/demo-os/demo-repository/x86_64
```

> Arch Custom Local Repository 的路徑，一樣放在「/opt/demo-os/demo-repository/x86_64」這個路徑，

> 參考「[ezarcher](https://osdn.net/projects/ezarch/releases/)」的作法，也可以放在「profile/airootfs/opt/demo-os/demo-repository/x86_64」這個路徑，上面設定一樣。

> 當然也可以放在「Github」上，不過上面的路徑設定就要改。這個就不在本篇討論了。


## 編輯「profile/packages.x86_64」

編輯「[profile/packages.x86_64](https://github.com/samwhelp/note-about-archlinux/blob/gh-pages/_demo/build-iso/demo-os/demo-iso-profile/demo-use-custom-local-repository/profile/packages.x86_64#L133)」，加入如下的內容

```
demo-hello
```

### 製作 iso

執行下面指令，開始製作 iso

``` sh
mkdir -p tmp

sudo mkarchiso -w tmp/work -o tmp/out -v profile
```

> 要注意的是，要先準備「tmp」這個資料夾。
