#!/usr/bin/env bash


##
## ## grub
##

pacman -S grub-bios os-prober

grub-install /dev/sdc

grub-mkconfig -o /boot/grub/grub.cfg


##
## change root user password
##

passwd



##
## install text editor
##

pacman -S vi vim neovim micro nano

