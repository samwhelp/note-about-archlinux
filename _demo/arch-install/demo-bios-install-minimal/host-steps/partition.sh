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
### Head: Model / partition_create
##

mod_partition_create () {

	sudo parted --script "${THE_TARGET_DEVICE}" -- \
		mktable gpt \
		mkpart primary 1M 2M \
		mkpart primary 2M '-1' \
		set 1 bios_grub on \
		print


	sudo mkfs.ext4 -F "${THE_TARGET_ROOT_PARTITION}"


	sudo parted "${THE_TARGET_DEVICE}" print

}

##
### Tail: Model / partition_create
################################################################################


################################################################################
### Head: Main
##

__main__ () {

	mod_partition_create

}

__main__

##
### Tail: Main
################################################################################
