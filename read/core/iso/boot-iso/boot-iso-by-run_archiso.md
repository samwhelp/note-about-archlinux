---
title: Boot ISO By run_archiso (QEMU)
nav_order: 1050
has_children: false
parent: Boot ISO
grand_parent: ISO
---


# Boot ISO By run_archiso (QEMU)


## 測試檔案

> 可以先[下載官方提供的ISO檔案](https://samwhelp.github.io/note-about-archlinux/read/core/iso/download-iso.html)


## 測試操作步驟

### Help

執行

``` sh
run_archiso -h
```

顯示

```
Usage:
    run_archiso [options]

Options:
    -a              set accessibility support using brltty
    -b              set boot type to 'BIOS' (default)
    -d              set image type to hard disk instead of optical disc
    -h              print help
    -i [image]      image to boot into
    -s              use Secure Boot (only relevant when using UEFI)
    -u              set boot type to 'UEFI'
    -v              use VNC display (instead of default SDL)
    -c [image]      attach an additional optical disc image (e.g. for cloud-init)

Example:
    Run an image using UEFI:
    $ run_archiso -u -i archiso-2020.05.23-x86_64.iso

```


### BIOS

執行

``` sh
run_archiso -i archlinux-2023.06.01-x86_64.iso
```

或是執行

``` sh
run_archiso -b -i archlinux-2023.06.01-x86_64.iso
```


### UEFI

> Run an image using UEFI:

執行

``` sh
run_archiso -u -i archlinux-2023.06.01-x86_64.iso
```




## Explore

執行

``` sh
pacman -Qo run_archiso
```

顯示

```
/usr/bin/run_archiso is owned by archiso 71-1
```

執行

``` sh
which run_archiso
```

顯示

```
/usr/bin/run_archiso
```

執行

``` sh
less $(which run_archiso)
```

## See Also

* 入門如何製作 Arch ISO / [測試 ISO](https://samwhelp.github.io/note-about-archlinux/read/core/iso/build-iso/start-build-arch-iso.html#%E6%B8%AC%E8%A9%A6-iso)
* [Boot ISO By QEMU](https://samwhelp.github.io/note-about-archlinux/read/core/iso/boot-iso/boot-iso-by-qemu.html)
