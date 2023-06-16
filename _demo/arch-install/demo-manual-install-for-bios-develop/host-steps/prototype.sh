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
### Head: Model / prototype
##

mod_prototype_prepare () {

	mkdir -p ./tmp

}

mod_prototype_copy_archiso_profile () {

	cp -rf "/usr/share/archiso/configs/releng/." "./tmp/profile"

}

mod_prototype_overlay_profile () {
	cp -rf "./asset/overlay/." "./tmp/profile/airootfs"
}

mod_prototype_to_rootfs () {
	sudo cp -rf "./tmp/profile/airootfs/." "/mnt"
}

mod_prototype () {

	mod_prototype_prepare

	mod_prototype_copy_archiso_profile

	mod_prototype_overlay_profile

	mod_prototype_to_rootfs

	return 0

}

##
### Tail: Model / prototype
################################################################################


################################################################################
### Head: Main
##

__main__ () {

	mod_prototype

}

__main__

##
### Tail: Main
################################################################################
