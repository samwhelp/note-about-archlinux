---
title: 在製作 Arch ISO 時，如何設定採用 Arch Custom Local Repository
nav_order: 1060
has_children: false
parent: Build ISO
---


## 在製作 Arch ISO 時，如何設定採用 Arch Custom Local Repository


## Arch Wiki

* pacman / Tips and tricks / [Custom local repository](https://wiki.archlinux.org/title/Pacman/Tips_and_tricks#Custom_local_repository)
* pacman / Tips and tricks / [Installing packages from a CD/DVD or USB stick](https://wiki.archlinux.org/title/Pacman/Tips_and_tricks#Installing_packages_from_a_CD/DVD_or_USB_stick)


## Howto

* [編輯「profile/pacman.conf」](#編輯「profile-pacman.conf」)
* [編輯「profile/packages.x86_64」](#編輯「profile-packages.x86_64」)
* [製作 iso](#製作-iso)


## 編輯「profile/pacman.conf」

編輯「profile/pacman.conf」，加入如下的內容

``` ini
[demo-os]
SigLevel = Optional TrustAll
Server = file:///opt/demo-os/demo-repository/$arch
#Server = file:///opt/demo-os/demo-repository/x86_64
```

## 編輯「profile/packages.x86_64」

編輯「profile/packages.x86_64」，加入如下的內容

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
