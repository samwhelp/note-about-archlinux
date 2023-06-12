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

source "${THE_CONFIG_FILE_PATH}"
#. "$THE_CONFIG_FILE_PATH"

##
### Tail: Init
################################################################################


################################################################################
### Head: Util / Debug
##

util_error_echo () {
	echo "$@" 1>&2
}

##
### Head: Util / Debug
################################################################################


################################################################################
### Head: Model / fstab_create
##

mod_fstab_create () {

	##
	## sudo sh -c 'genfstab -U /mnt >> /mnt/etc/fstab'
	##

	util_error_echo
	util_error_echo "sudo sh -c 'genfstab -U ${THE_TARGET_ROOT_DIR_PATH} >> ${THE_TARGET_FSTAB_FILE_PATH}'"
	util_error_echo

	sudo sh -c "genfstab -U ${THE_TARGET_ROOT_DIR_PATH} >> ${THE_TARGET_FSTAB_FILE_PATH}"

}

##
### Tail: Model / fstab_create
################################################################################


################################################################################
### Head: Main
##

__main__ () {

	mod_fstab_create

}

__main__

##
### Tail: Main
################################################################################
