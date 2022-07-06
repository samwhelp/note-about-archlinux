

## Arch Wiki

* [Archiso](https://wiki.archlinux.org/title/archiso) ([中文](https://wiki.archlinux.org/title/Archiso_(%E7%AE%80%E4%BD%93%E4%B8%AD%E6%96%87)))



## Howto

* [install archiso](install-archiso)
* [prepare profile](prepare-profile)
* [build iso](build-iso)
* [install qemu](install-qemu)
* [test iso](test-iso)


### install archiso

run

``` sh
sudo pacman -Sy --needed archiso
```


### prepare profile

run

``` sh
cp -rf /usr/share/archiso/configs/releng ./profile
```


### build iso

run

``` sh
sudo mkarchiso -v profile
```

or run

``` sh
sudo mkarchiso -w work -o out -v profile
```

or run

``` sh
mkdir -p tmp

sudo mkarchiso -w tmp/work -o tmp/out -v profile
```


### install qemu

run

``` sh
sudo pacman -Sy --needed qemu-desktop
```

### test iso

or run

``` sh
run_archiso -i out/*.iso
```

or run

``` sh
run_archiso -i tmp/out/*.iso
```

## See Also

* [ventoy](https://www.ventoy.net/en/index.html)
