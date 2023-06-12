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
### Head: Model / system_create
##

mod_system_create () {

	##
	## sudo pacstrap /mnt base linux
	##

	util_error_echo
	util_error_echo "sudo pacstrap ${THE_TARGET_ROOT_DIR_PATH} ${THE_TARGET_PACKAGE_LIST}"
	util_error_echo

	sudo pacstrap "${THE_TARGET_ROOT_DIR_PATH}" ${THE_TARGET_PACKAGE_LIST}

}

##
### Tail: Model / system_create
################################################################################


################################################################################
### Head: Main
##

__main__ () {

	mod_system_create

}

__main__

##
### Tail: Main
################################################################################
