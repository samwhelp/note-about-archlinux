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
### Head: Option
##

THE_DEFAULT_RUN="${THE_DEFAULT_RUN:=make-sys}"

sys_default_run () {
	echo "${THE_DEFAULT_RUN}"
}

##
### Tail: Option
################################################################################


################################################################################
### Head: Model / Build SYS
##

mod_sys_build () {

	local to_run="$(sys_default_run)"

	local delegate="${THE_PLAN_DIR_PATH}/steps.sh"

	sudo THE_DEFAULT_RUN="${to_run}" THE_DEFAULT_DISTRO="main-xfce" "${delegate}"

}


##
### Tail: Model / Build SYS
################################################################################




################################################################################
### Head: Main
##

__main__ () {

	mod_sys_build

}

__main__

##
### Tail: Main
################################################################################
