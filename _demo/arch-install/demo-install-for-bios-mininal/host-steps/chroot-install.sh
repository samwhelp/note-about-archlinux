#!/usr/bin/env bash


################################################################################
### Head: Note
##

## * https://github.com/samwhelp/skel-project-plan/blob/gh-pages/demo/sh/project/bin/install.sh

##
### Tail: Note
################################################################################


################################################################################
### Head: Init
##

THE_BASE_DIR_PATH="$(cd -- "$(dirname -- "$0")" ; pwd)"
THE_PLAN_DIR_PATH="${THE_BASE_DIR_PATH}"
THE_CONFIG_FILE_PATH="${THE_PLAN_DIR_PATH}/config.sh"
THE_UTIL_FILE_PATH="${THE_PLAN_DIR_PATH}/util.sh"

source "${THE_CONFIG_FILE_PATH}"
source "${THE_UTIL_FILE_PATH}"

##
### Tail: Init
################################################################################




################################################################################
### Head: Model / chroot
##

mod_chroot_install () {

	##
	## sudo arch-chroot /mnt /root/chroot-install.sh
	##

	util_error_echo
	util_error_echo "sudo install -Dm755 ../chroot-steps/chroot-install.sh ${THE_TARGET_ROOT_DIR_PATH}/root/chroot-install.sh"
	util_error_echo

	sudo install -Dm755 ../chroot-steps/chroot-install.sh "${THE_TARGET_ROOT_DIR_PATH}/root/chroot-install.sh"


	util_error_echo
	util_error_echo "sudo arch-chroot ${THE_TARGET_ROOT_DIR_PATH} /root/chroot-install.sh"
	util_error_echo

	sudo arch-chroot "${THE_TARGET_ROOT_DIR_PATH}" "/root/chroot-install.sh"

}

##
### Tail: Model / chroot
################################################################################


################################################################################
### Head: Main
##

__main__ () {

	mod_chroot_install

}

__main__

##
### Tail: Main
################################################################################
