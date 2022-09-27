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

## 解法

先移除「qt5-styleplugins」

``` sh
sudo pacman -R qt5-styleplugins
```

重新編譯，重新安裝

``` sh
sudo pamac build qt5-styleplugins
```

## Link


* Search: 「[archlinux Cannot mix incompatible Qt library (5.15.5) with this library (5.15.6)](https://www.google.com/search?q=archlinux+Cannot+mix+incompatible+Qt+library+%285.15.5%29+with+this+library+%285.15.6%29)」
* [https://bbs.archlinux.org/viewtopic.php?id=274830](https://bbs.archlinux.org/viewtopic.php?id=274830)
* [https://bbs.archlinux.org/viewtopic.php?id=274702](https://bbs.archlinux.org/viewtopic.php?id=274702)

``` sh
pacman -Qm | grep ^qt5
```

``` sh
pacman -Qm | grep qt5
```
