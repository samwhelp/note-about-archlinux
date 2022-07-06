---
title: 製作 Archiso 的前置作業
nav_order: 1010
has_children: false
parent: Build ISO
---


# 製作 Archiso 的前置作業


## 概要說明


先準備兩個「隨身碟」或是「隨身外接硬碟」。

> 請準備「讀寫速度」快的，否則在大量讀寫的狀況下，執行程式會有卡頓的感受。

這兩個個隨身碟，我們先命名為「隨身碟-1」和「隨身碟-2」。

首先先將「隨身碟-1」，製作成「[ventoy 隨身碟](https://www.ventoy.net/en/index.html)」。

若您原本就有「Linux」環境，可以參考「[我之前的筆記](https://samwhelp.github.io/note-about-ventoy/read/start.html)」來製作。

若是其他的環境，則請使用「[ventoy](https://www.google.com/search?q=ventoy)」當作關鍵字搜尋，應該可以找到相關的參考文章。

這個「ventoy 隨身碟」的功用，

一開始，我們可以先下載下面所列的一些基於「Arch Linux」的「發行版」，放置到這個「ventoy 隨身碟」，

使用這個「ventoy 隨身碟」開機，

先安裝一個「Arch Linux」環境到「隨身碟-2」，

這樣可以在「隨身碟-2」這個環境，透過「[archiso](https://wiki.archlinux.org/title/archiso)」這個工具，來製作「客製的arch iso檔」。

最終產出的「客製的arch iso檔」，就可以再複製到一開始的「ventoy 隨身碟」來測試開機。

開機後，也可以將「客製的arch iso檔」安裝到「隨身碟-2」，

所以一開始「隨身碟-2」可以先分成多個「分割區」，這樣就可以分別安裝系統到不同的分割區。

透過「grub」可以多重開機。



## 基於「Arch Linux」的「發行版」

會推薦下面這些基於「Arch Linux」的「發行版」先來安裝一個「Arch Linux」，

是因為這些發行版有提供「圖形使用者介面安裝程式([calamares](https://calamares.io/))」，

可以先快速的安裝好一個「Arch Linux」讓您可以開始接下來的步驟。

而且這些發行版，也是目前討論的議題「build archiso」很好的參考資料來源。

| 發行版 | More |
| --- | --- |
| [Archcraft](https://archcraft.io/) | [More](#archcraft) |
| [Alcilinux](https://alci.online/github/) | [More](#alcilinux) |
| [Arcolinux](https://arcolinux.com/) | [More](#arcolinux) |
| [Ezarcher](https://osdn.net/projects/ezarch/releases/) | [More](#ezarcher) |
| [Endeavouros](https://endeavouros.com/) | [More](#endeavouros) |
| [XeroLinux](https://xerolinux.xyz/) | [More](#xerolinux) |
| [GarudaLinux](https://garudalinux.org/) | [More](#garudalinux) |
| [Axyl-os](https://axyl-os.github.io/) | [More](#axyl-os) |
| [Xelphlinux](https://xelphlinux.com/) | [More](#xelphlinux) |



## Archcraft


## Alcilinux


## Arcolinux


## Ezarcher


## Endeavouros


## XeroLinux


## GarudaLinux


## Axyl-os


## Xelphlinux



