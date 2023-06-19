---
title: 入門如何製作 Arch ISO
nav_order: 1020
has_children: false
parent: Build ISO
grand_parent: ISO
---


# 入門如何製作 Arch ISO


## 範例

| 範例 |
| --- |
| [demo-start-build-arch-iso](https://github.com/samwhelp/note-about-archlinux/tree/gh-pages/_demo/iso/build-iso/demo-os/demo-iso-profile/demo-start-build-arch-iso) |


## Arch Wiki

* [Archiso](https://wiki.archlinux.org/title/archiso) ([中文](https://wiki.archlinux.org/title/Archiso_(%E7%AE%80%E4%BD%93%E4%B8%AD%E6%96%87)))


## Howto

* [安裝 archlinux](#安裝-archlinux)
* [安裝 archiso](#安裝-archiso)
* [複製 profile](#複製-profile)
* [製作 iso](#製作-iso)
* [安裝 qemu](#安裝-qemu)
* [測試 iso](#測試-iso)


### 安裝 archlinux

先安裝一個「Arch Linux」系統，請參考另一篇「[製作 Archiso 的前置作業 ](https://samwhelp.github.io/note-about-archlinux/read/core/iso/build-iso/prepare.html)」的說明。

> 或是也可以透過「Docker」的環境來製作，

> 可以參考「[archiso-builder](https://github.com/nlhomme/archiso-builder)」或是「GitHub / elementary / [os](https://github.com/elementary/os)」

### 安裝 archiso

執行下面指令，安裝「Package: [archiso](https://archlinux.org/packages/extra/any/archiso/)」

``` sh
sudo pacman -Sy --needed archiso
```


### 複製 profile

執行下面指令，複製「[/usr/share/archiso/configs/releng](https://gitlab.archlinux.org/archlinux/archiso/-/tree/master/configs/releng)」這個資料夾以及所有檔案，到目前所在資料夾，並且更名為「profile」。

``` sh
cp -rf /usr/share/archiso/configs/releng ./profile
```


### 製作 iso

執行下面指令，開始製作 iso

``` sh
sudo mkarchiso -v profile
```

上面的指令，等同下面的指令，

也就是製作過程產生的資料，會放在「work」這個資料夾

最終產生的「iso」檔案，會放在「out」這個資料夾。

``` sh
sudo mkarchiso -w work -o out -v profile
```

所以「-w tmp/work」可以更改「work」的路徑

所以「-o tmp/out」可以更改「out」的路徑

> 要注意的是，要先準備「tmp」這個資料夾。

``` sh
mkdir -p tmp

sudo mkarchiso -w tmp/work -o tmp/out -v profile
```


### 安裝 qemu

接下來可以透過「[qemu](https://wiki.archlinux.org/title/QEMU)」來測試，

所以先執行下面指令，安裝「Package: [qemu-desktop](https://archlinux.org/packages/extra/x86_64/qemu-desktop/)」

``` sh
sudo pacman -Sy --needed qemu-desktop
```

### 測試 ISO

執行下面指令，來測試最終產出的「iso」，

``` sh
run_archiso -i out/*.iso
```

若有更改路徑，則是執行下面指令，

``` sh
run_archiso -i tmp/out/*.iso
```

> 也可以透過「[ventoy](https://samwhelp.github.io/note-about-archlinux/read/start/download/boot_iso_by_ventoy.html)」來測試最終產出的「iso」。


