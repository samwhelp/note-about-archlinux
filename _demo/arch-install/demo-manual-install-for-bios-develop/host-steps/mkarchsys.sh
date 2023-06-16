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
### Head: Path
##

THE_BASE_ARCHISO_PROFILE_DIR_PATH="/usr/share/archiso/configs/releng"

THE_PLAN_DIR_PATH="${THE_BASE_DIR_PATH}"




THE_PLAN_TMP_DIR_NAME="tmp"
THE_PLAN_TMP_DIR_PATH="${THE_PLAN_DIR_PATH}/${THE_PLAN_TMP_DIR_NAME}"

THE_PLAN_WORK_DIR_NAME="work"
THE_PLAN_WORK_DIR_PATH="${THE_PLAN_TMP_DIR_PATH}/${THE_PLAN_WORK_DIR_NAME}"

THE_PLAN_OUT_DIR_NAME="out"
THE_PLAN_OUT_DIR_PATH="${THE_PLAN_TMP_DIR_PATH}/${THE_PLAN_OUT_DIR_NAME}"




THE_PLAN_PROFILE_DIR_NAME="profile"
THE_PLAN_PROFILE_DIR_PATH="${THE_PLAN_TMP_DIR_PATH}/${THE_PLAN_PROFILE_DIR_NAME}"

THE_PLAN_PROFILE_ROOTFS_DIR_NAME="airootfs"
THE_PLAN_PROFILE_ROOTFS_DIR_PATH="${THE_PLAN_PROFILE_DIR_PATH}/${THE_PLAN_PROFILE_ROOTFS_DIR_NAME}"




THE_PLAN_ASSET_DIR_NAME="asset"
THE_PLAN_ASSET_DIR_PATH="${THE_PLAN_DIR_PATH}/${THE_PLAN_ASSET_DIR_NAME}"

THE_PLAN_OVERLAY_DIR_NAME="overlay"
THE_PLAN_OVERLAY_DIR_PATH="${THE_PLAN_ASSET_DIR_PATH}/${THE_PLAN_OVERLAY_DIR_NAME}"

THE_PLAN_BOOT_DIR_NAME="boot"
THE_PLAN_BOOT_DIR_PATH="${THE_PLAN_ASSET_DIR_PATH}/${THE_PLAN_BOOT_DIR_NAME}"

THE_PLAN_BUILD_DIR_NAME="build"
THE_PLAN_BUILD_DIR_PATH="${THE_PLAN_ASSET_DIR_PATH}/${THE_PLAN_BUILD_DIR_NAME}"

THE_PLAN_PACKAGE_DIR_NAME="package"
THE_PLAN_PACKAGE_DIR_PATH="${THE_PLAN_ASSET_DIR_PATH}/${THE_PLAN_PACKAGE_DIR_NAME}"

THE_PLAN_PACKAGE_BUNDLE_DIR_NAME="bundle"
THE_PLAN_PACKAGE_BUNDLE_DIR_PATH="${THE_PLAN_PACKAGE_DIR_PATH}/${THE_PLAN_PACKAGE_BUNDLE_DIR_NAME}"



THE_PLAN_CONFIG_DIR_NAME="config"
THE_PLAN_CONFIG_DIR_PATH="${THE_PLAN_ASSET_DIR_PATH}/${THE_PLAN_CONFIG_DIR_NAME}"

THE_PLAN_CONFIG_MAIN_DIR_NAME="main"
THE_PLAN_CONFIG_MAIN_DIR_PATH="${THE_PLAN_CONFIG_DIR_PATH}/${THE_PLAN_CONFIG_MAIN_DIR_NAME}"




THE_PLAN_HELPER_DIR_NAME="helper"
THE_PLAN_HELPER_DIR_PATH="${THE_PLAN_DIR_PATH}/${THE_PLAN_HELPER_DIR_NAME}"


THE_PLAN_DISTRO_DIR_NAME="distro"
THE_PLAN_DISTRO_DIR_PATH="${THE_PLAN_HELPER_DIR_PATH}/${THE_PLAN_DISTRO_DIR_NAME}"



##
### Tail: Path
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
### Head: Limit Run User
##

sys_root_user_required () {

	if [[ "${EUID}" = 0 ]]; then
		return 0
	else
		util_error_echo "Please Run As Root"
		#sleep 2
		exit 0
	fi

}

##
### Tail: Limit Run User
################################################################################







################################################################################
### Head: Model / Build SYS
##

mod_sys_make_prepare () {

	##sys_package_required

	##sys_clean_on_prepare

	mod_sys_profile_prepare

}

mod_sys_make_start () {

	local to_run="to_$(sys_default_run)"

	if [ "${to_run}" != "to_make-sys" ]; then
		return
	fi

	mod_system_create

}

mod_sys_make_finish () {

	##sys_clean_on_finish

	return 0

}

mod_sys_build () {

	mod_sys_make_prepare
	mod_sys_make_start
	mod_sys_make_finish

}

##
### Tail: Model / Build SYS
################################################################################




################################################################################
### Head: Model / Build SYS / Base Profile
##

mod_sys_profile_prepare () {

	util_error_echo
	util_error_echo "##"
	util_error_echo "## Prepare System Profile"
	util_error_echo "##"
	util_error_echo

	mod_sys_profile_base

}

mod_sys_profile_base () {

	util_error_echo
	util_error_echo
	util_error_echo "##"
	util_error_echo "## Prepare System Profile / Base"
	util_error_echo "##"
	util_error_echo


	#util_error_echo
	#util_error_echo "mkdir -p ${THE_TARGET_ROOT_DIR_PATH}"
	#mkdir -p "${THE_TARGET_ROOT_DIR_PATH}"


	util_error_echo
	util_error_echo "cp -rf ${THE_PLAN_PROFILE_ROOTFS_DIR_PATH}/. ${THE_TARGET_ROOT_DIR_PATH}"
	cp -rf "${THE_PLAN_PROFILE_ROOTFS_DIR_PATH}/." "${THE_TARGET_ROOT_DIR_PATH}"



	util_error_echo
}

##
### Tail: Model / Build SYS / Base Profile
################################################################################






################################################################################
### Head: Model / system_create
##

mod_environment () {

	##
	## * https://gitlab.archlinux.org/archlinux/archiso/-/blob/master/archiso/mkarchiso#L8-L15
	## * https://github.com/archlinux/archiso/blob/master/archiso/mkarchiso#L8-L15
	##

	# Control the environment
	umask 0022
	export LC_ALL="C.UTF-8"
	if [[ -v LANGUAGE ]]; then
		# LC_ALL=C.UTF-8, unlike LC_ALL=C, does not override LANGUAGE.
		# See https://sourceware.org/bugzilla/show_bug.cgi?id=16621 and https://savannah.gnu.org/bugs/?62815
		unset LANGUAGE
	fi

}

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
	sys_root_user_required
	mod_environment
	mod_sys_build

}

__main__

##
### Tail: Main
################################################################################
