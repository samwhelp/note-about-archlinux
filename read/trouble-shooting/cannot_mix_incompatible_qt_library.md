---
title: Cannot mix incompatible Qt library
nav_order: 8081
has_children: false
parent: 故障排除
---


# Cannot mix incompatible Qt library

## 情況

執行

``` sh
pcmanfm-qt
```

顯示

```
Cannot mix incompatible Qt library (5.15.5) with this library (5.15.6)
Aborted (core dumped)
```

或是在「系統更新」時，出現如下的資訊

```
(4/6) Qt5 Upgrade Warning
[WARNING] qt5-base was updated, qt5 applications will break until qt5-styleplugins is rebuilt.
```

## 解法

先移除「qt5-styleplugins」

``` sh
sudo pacman -R qt5-styleplugins
```

重新編譯，重新安裝「[qt5-styleplugins](https://aur.archlinux.org/packages/qt5-styleplugins)」

透過「yay」，重新編譯，重新安裝

``` sh
yay -Sy --needed qt5-styleplugins
```

或是透過「pamac」，重新編譯，重新安裝

``` sh
sudo pamac build qt5-styleplugins
```


## Check

執行下面指令

``` sh
pacman -Qm | grep ^qt5
```

或是執行下面指令

``` sh
pacman -Qm | grep qt5
```

類似顯示如下

```
qt5-styleplugins 5.0.0.20170311-34
```


## Link

* Search: 「[archlinux Cannot mix incompatible Qt library (5.15.5) with this library (5.15.6)](https://www.google.com/search?q=archlinux+Cannot+mix+incompatible+Qt+library+%285.15.5%29+with+this+library+%285.15.6%29)」
* [https://bbs.archlinux.org/viewtopic.php?id=274830](https://bbs.archlinux.org/viewtopic.php?id=274830)
* [https://bbs.archlinux.org/viewtopic.php?id=274702](https://bbs.archlinux.org/viewtopic.php?id=274702)
* AUR / [qt5-styleplugins](https://aur.archlinux.org/packages/qt5-styleplugins)

