---
title: 入門如何製作 Arch Repository
nav_order: 1040
has_children: false
parent: Build ISO
grand_parent: ISO
---


## 入門如何製作 Arch Repository


## 範例

| 範例 |
| --- |
| [demo-repository](https://github.com/samwhelp/note-about-archlinux/tree/gh-pages/_demo/iso/build-iso/demo-os/demo-repository) |


## Arch Wiki

* pacman / Tips and tricks / [Custom local repository](https://wiki.archlinux.org/title/Pacman/Tips_and_tricks#Custom_local_repository)


## Howto

* [準備資料夾](#準備資料夾)
* [放置「範例Package」](#放置範例Package)
* [更新資料庫檔案](#更新資料庫檔案)


## 準備資料夾

要先準備一個資料夾，路徑如下

* /opt/demo-os/demo-repository/x86_64

先產生一個資料夾「/opt/demo-os」

執行

``` sh
sudo mkdir -p /opt/demo-os

sudo chmod 777 /opt/demo-os
```

或是執行

``` sh
sudo mkdir -p /opt/demo-os

sudo chown $(id -u):$(id -g) /opt/demo-os
```

接著就可以產生「/opt/demo-os/demo-repository/x86_64」這個資料夾

執行下面指令

``` sh
mkdir -p /opt/demo-os/demo-repository/x86_64
```


## 放置範例Package

將剛剛製作的「Arch Package: [demo-hello-0.1-1-any.pkg.tar.zst](https://samwhelp.github.io/note-about-archlinux/read/build-iso/start-build-arch-package.html#%E8%A3%BD%E4%BD%9C-package)」，


放到「/opt/demo-os/demo-repository/x86_64」這個資料夾裡面。


## 更新資料庫檔案

* man 8 [repo-add](https://man.archlinux.org/man/repo-add.8)

切換到「/opt/demo-os/demo-repository/x86_64」這個資料夾

``` sh
cd /opt/demo-os/demo-repository/x86_64
```

執行下面指令

``` sh
repo-add -n -R demo-os.db.tar.gz *.pkg.tar.zst
```

就會產生下面四個檔案

* demo-os.db
* demo-os.db.tar.gz
* demo-os.files
* demo-os.files.tar.gz
