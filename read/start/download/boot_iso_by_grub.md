---
title: Boot ISO By GRUB
nav_order: 7040
has_children: false
parent: 下載
grand_parent: 入門
---


# Boot ISO By GRUB

## 範例

| GRUB Boot ISO 範例 | 設定檔路徑 | 是否需要執行 update-grub |
| --- | --- | --- |
| demo_40_custom / [latest](https://github.com/samwhelp/note-about-grub/blob/gh-pages/_demo/prototype/boot_iso/demo_40_custom/ArchLinux/latest/) | [/etc/grub.d/40_custom](https://github.com/samwhelp/note-about-grub/blob/gh-pages/_demo/prototype/boot_iso/demo_40_custom/ArchLinux/latest/40_custom) | 修改後，需要執行 `sudo update-grub` |
| demo_41_custom / [latest](https://github.com/samwhelp/note-about-grub/blob/gh-pages/_demo/prototype/boot_iso/demo_41_custom/ArchLinux/latest/) | [/boot/grub/custom.cfg](https://github.com/samwhelp/note-about-grub/blob/gh-pages/_demo/prototype/boot_iso/demo_41_custom/ArchLinux/latest/custom.cfg) | 修改後，**不需要**執行 `sudo update-grub` |


## GRUB Menu Entry / Boot ISO 樣板 / Arch Linux

``` sh
menuentry "Arch 2022.04.05 ISO" --class Arch {
	set iso_file="/opt/iso/arch/latest/archlinux-2022.04.05-x86_64.iso"
	search --set=iso_partition --no-floppy --file $iso_file
	probe --set=iso_partition_uuid --fs-uuid $iso_partition
	set img_dev="/dev/disk/by-uuid/$iso_partition_uuid"
	loopback loop ($iso_partition)$iso_file
	set boot_option=""
	#set boot_option="quiet splash"
	linux (loop)/arch/boot/x86_64/vmlinuz-linux img_dev=$img_dev img_loop=$iso_file $boot_option
	initrd (loop)/arch/boot/intel-ucode.img (loop)/arch/boot/amd-ucode.img (loop)/arch/boot/x86_64/initramfs-linux.img
}
```


## See Also

* Grub 探索筆記 / [GRUB Boot ISO 範例](https://samwhelp.github.io/note-about-grub/read/howto/boot_iso.html)
