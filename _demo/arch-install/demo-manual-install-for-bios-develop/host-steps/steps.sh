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
### Head: Config
##

sys_config_main_user_name () {
	cat "$THE_PLAN_CONFIG_MAIN_DIR_PATH/main-user-name.conf"
}

sys_config_main_user_password () {
	cat "$THE_PLAN_CONFIG_MAIN_DIR_PATH/main-user-password.conf"
}

sys_config_root_user_password () {
	cat "$THE_PLAN_CONFIG_MAIN_DIR_PATH/root-user-password.conf"
}

##
### Tail: Config
################################################################################


################################################################################
### Head: Option
##

THE_DEFAULT_DISTRO="${THE_DEFAULT_DISTRO:=main-xfce}"

sys_default_distro () {
	echo "${THE_DEFAULT_DISTRO}"
}


THE_DEFAULT_RUN="${THE_DEFAULT_RUN:=make-iso}"

sys_default_run () {
	echo "${THE_DEFAULT_RUN}"
}

##
### Tail: Option
################################################################################




################################################################################
### Head: Signal
##

exit_on_signal_interrupted () {

	util_error_echo
	util_error_echo "##"
	util_error_echo "## **Script Interrupted**"
	util_error_echo "##"
	util_error_echo

	sys_clean_on_exit

	sleep 2

	exit 0

}

exit_on_signal_terminated () {

	util_error_echo
	util_error_echo "##"
	util_error_echo "## **Script Terminated**"
	util_error_echo "##"
	util_error_echo

	sys_clean_on_exit

	sleep 2

	exit 0

}

sys_signal_bind () {

	trap exit_on_signal_interrupted SIGINT
	trap exit_on_signal_terminated SIGTERM

}

##
### Tail: Signal
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
### Head: Clean
##

sys_clean_on_prepare () {

	util_error_echo
	util_error_echo "##"
	util_error_echo "## Cleaning Data On Prepare"
	util_error_echo "##"
	util_error_echo


	util_error_echo
	util_error_echo "rm -rf ${THE_PLAN_TMP_DIR_PATH}"
	rm -rf "${THE_PLAN_TMP_DIR_PATH}"


	util_error_echo

}

sys_clean_on_exit () {

	util_error_echo
	util_error_echo "##"
	util_error_echo "## Cleaning Data On Exit"
	util_error_echo "##"
	util_error_echo



}

sys_clean_on_finish () {

	util_error_echo
	util_error_echo "##"
	util_error_echo "## Cleaning Data On Finish"
	util_error_echo "##"
	util_error_echo


}

##
### Tail: Clean
################################################################################


################################################################################
### Head: Requirements
##

sys_package_required () {

	return 0

	util_error_echo
	util_error_echo "##"
	util_error_echo "## Check Package Required"
	util_error_echo "##"
	util_error_echo


	util_error_echo
	util_error_echo "pacman -S --noconfirm archlinux-keyring"
	util_error_echo
	pacman -S --noconfirm archlinux-keyring


	util_error_echo


	util_error_echo
	util_error_echo "pacman -S --needed --noconfirm archiso mkinitcpio-archiso"
	util_error_echo
	pacman -S --needed --noconfirm archiso mkinitcpio-archiso


	util_error_echo

}

##
### Tail: Requirements
################################################################################




################################################################################
### Head: Model / Build SYS
##

mod_sys_make_start_create_system () {

	util_error_echo
	util_error_echo "##"
	util_error_echo "## Building New System"
	util_error_echo "##"
	util_error_echo

	#sleep 5
	#return 0

	#util_error_echo "mkarchiso -w ${THE_PLAN_WORK_DIR_PATH} -o ${THE_PLAN_OUT_DIR_PATH} -v ${THE_PLAN_PROFILE_DIR_PATH}"
	#mkarchiso -w "${THE_PLAN_WORK_DIR_PATH}" -o "${THE_PLAN_OUT_DIR_PATH}" -v "${THE_PLAN_PROFILE_DIR_PATH}"


	util_error_echo
	util_error_echo


}

mod_sys_make_prepare () {

	sys_package_required

	sys_clean_on_prepare

	mod_sys_profile_prepare

}

mod_sys_make_start () {

	local to_run="to_$(sys_default_run)"

	if [ "${to_run}" != "to_make-sys" ]; then
		return
	fi

	mod_sys_make_start_create_system

}

mod_sys_make_finish () {

	sys_clean_on_finish

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
	mod_sys_profile_overlay


}

mod_sys_profile_base () {

	util_error_echo
	util_error_echo
	util_error_echo "##"
	util_error_echo "## Prepare System Profile / Base"
	util_error_echo "##"
	util_error_echo


	util_error_echo
	util_error_echo "mkdir -p ${THE_PLAN_PROFILE_DIR_PATH}"
	mkdir -p "${THE_PLAN_PROFILE_DIR_PATH}"


	util_error_echo
	util_error_echo "cp -rf ${THE_BASE_ARCHISO_PROFILE_DIR_PATH}/. ${THE_PLAN_PROFILE_DIR_PATH}"
	cp -rf "${THE_BASE_ARCHISO_PROFILE_DIR_PATH}/." "${THE_PLAN_PROFILE_DIR_PATH}"



	util_error_echo
}

##
### Tail: Model / Build SYS / Base Profile
################################################################################


################################################################################
### Head: Model / Build SYS / Overlay Profile
##

mod_sys_profile_overlay () {

	util_error_echo
	util_error_echo
	util_error_echo "##"
	util_error_echo "## Prepare System Profile / Overlay"
	util_error_echo "##"
	util_error_echo


	##
	## ## base
	##

	mod_overlay_base


	##
	## ## bootloader
	##

	## make-sys not need this steps
	##mod_overlay_bootloader


	##
	## ## lsb-release
	##

	mod_overlay_lsb_release


	##
	## ## profiledef
	##

	mod_overlay_profiledef


	##
	## ## package
	##

	mod_overlay_package


	##
	## ## permission
	##

	mod_overlay_permission


	##
	## ## locale
	##

	mod_overlay_locale


	##
	## ## systemd
	##

	mod_overlay_systemd


}


##
### Tail: Model / Build SYS / Overlay Profile
################################################################################


################################################################################
### Head: Model / Overlay / base
##

mod_overlay_base () {

	mod_overlay_pre_remove
	mod_overlay_by_dir

}

##
### Tail: Model / Overlay / base
################################################################################


################################################################################
### Head: Model / Overlay / by_dir
##

mod_overlay_by_dir () {

	util_error_echo
	util_error_echo "cp -rf ${THE_PLAN_OVERLAY_DIR_PATH}/. ${THE_PLAN_PROFILE_ROOTFS_DIR_PATH}"
	cp -rf "${THE_PLAN_OVERLAY_DIR_PATH}/." "${THE_PLAN_PROFILE_ROOTFS_DIR_PATH}"

}

##
### Tail: Model / Overlay / by_dir
################################################################################


################################################################################
### Head: Model / Overlay / pre_remove
##

mod_overlay_pre_remove () {

	mod_overlay_remove_motd
	mod_overlay_remove_skel
	mod_overlay_remove_pacman_hook

	mod_overlay_remove_bootloader_efiboot
	mod_overlay_remove_bootloader_grub
	mod_overlay_remove_bootloader_syslinux
}

mod_overlay_remove_motd () {

	util_error_echo
	util_error_echo "rm -f ${THE_PLAN_PROFILE_ROOTFS_DIR_PATH}/etc/motd"
	rm -f "${THE_PLAN_PROFILE_ROOTFS_DIR_PATH}/etc/motd"

}

mod_overlay_remove_skel () {

	util_error_echo
	util_error_echo "rm -rf ${THE_PLAN_PROFILE_ROOTFS_DIR_PATH}/etc/skel"
	rm -rf "${THE_PLAN_PROFILE_ROOTFS_DIR_PATH}/etc/skel"

}

mod_overlay_remove_pacman_hook () {

	util_error_echo
	util_error_echo "rm -rf ${THE_PLAN_PROFILE_ROOTFS_DIR_PATH}/etc/pacman.d/hooks"
	rm -rf "${THE_PLAN_PROFILE_ROOTFS_DIR_PATH}/etc/pacman.d/hooks"


}

mod_overlay_remove_bootloader_efiboot () {

	util_error_echo
	util_error_echo "rm -rf ${THE_PLAN_PROFILE_DIR_PATH}/efiboot"
	rm -rf "${THE_PLAN_PROFILE_DIR_PATH}/efiboot"

}

mod_overlay_remove_bootloader_grub () {

	util_error_echo
	util_error_echo "rm -rf ${THE_PLAN_PROFILE_DIR_PATH}/grub"
	rm -rf "${THE_PLAN_PROFILE_DIR_PATH}/grub"

}

mod_overlay_remove_bootloader_syslinux () {

	util_error_echo
	util_error_echo "rm -rf ${THE_PLAN_PROFILE_DIR_PATH}/syslinux"
	rm -rf "${THE_PLAN_PROFILE_DIR_PATH}/syslinux"

}



##
### Tail: Model / Overlay / pre_remove
################################################################################


################################################################################
### Head: Model / Overlay / boot loader
##

mod_overlay_bootloader () {

	mod_overlay_bootloader_efiboot
	mod_overlay_bootloader_grub
	mod_overlay_bootloader_syslinux

}

mod_overlay_bootloader_efiboot () {

	util_error_echo
	util_error_echo "cp -rf ${THE_PLAN_BOOT_DIR_PATH}/efiboot/. ${THE_PLAN_PROFILE_DIR_PATH}/efiboot"
	cp -rf "${THE_PLAN_BOOT_DIR_PATH}/efiboot/." "${THE_PLAN_PROFILE_DIR_PATH}/efiboot"

}

mod_overlay_bootloader_grub () {

	util_error_echo
	util_error_echo "cp -rf ${THE_PLAN_BOOT_DIR_PATH}/grub/. ${THE_PLAN_PROFILE_DIR_PATH}/grub"
	cp -rf "${THE_PLAN_BOOT_DIR_PATH}/grub/." "${THE_PLAN_PROFILE_DIR_PATH}/grub"

}

mod_overlay_bootloader_syslinux () {

	util_error_echo
	util_error_echo "cp -rf ${THE_PLAN_BOOT_DIR_PATH}/syslinux/. ${THE_PLAN_PROFILE_DIR_PATH}/syslinux"
	cp -rf "${THE_PLAN_BOOT_DIR_PATH}/syslinux/." "${THE_PLAN_PROFILE_DIR_PATH}/syslinux"

}



##
### Tail: Model / Overlay / boot loader
################################################################################


################################################################################
### Head: Model / Overlay / permission
##

mod_overlay_permission () {

	mod_overlay_passwd
	mod_overlay_group
	mod_overlay_shadow
	mod_overlay_gshadow

}

mod_overlay_passwd () {

	local main_user_name="$(sys_config_main_user_name)"

	util_error_echo
	util_error_echo "## overlay ${THE_PLAN_PROFILE_ROOTFS_DIR_PATH}/etc/passwd"
	util_error_echo

cat > "${THE_PLAN_PROFILE_ROOTFS_DIR_PATH}/etc/passwd" << EOF
root:x:0:0:root:/root:/usr/bin/bash
${main_user_name}:x:1000:1000::/home/${main_user_name}:/bin/bash
EOF


	return 0

}

mod_overlay_group () {

	local main_user_name="$(sys_config_main_user_name)"

	util_error_echo
	util_error_echo "## overlay ${THE_PLAN_PROFILE_ROOTFS_DIR_PATH}/etc/group"
	util_error_echo

cat > "${THE_PLAN_PROFILE_ROOTFS_DIR_PATH}/etc/group" << EOF
root:x:0:root
sys:x:3:bin,${main_user_name}
network:x:90:${main_user_name}
power:x:98:${main_user_name}
adm:x:999:${main_user_name}
wheel:x:998:${main_user_name}
uucp:x:987:${main_user_name}
optical:x:990:${main_user_name}
scanner:x:991:${main_user_name}
rfkill:x:983:${main_user_name}
video:x:986:${main_user_name}
storage:x:988:${main_user_name}
audio:x:995:${main_user_name}
users:x:985:${main_user_name}
nopasswdlogin:x:966:${main_user_name}
autologin:x:967:${main_user_name}
sambashare:x:959:${main_user_name}
${main_user_name}:x:1000:
EOF

	return 0

}

mod_overlay_shadow () {

	local main_user_name="$(sys_config_main_user_name)"
	local main_user_password="$(sys_config_main_user_password)"
	local root_user_password="$(sys_config_root_user_password)"
	local main_user_password_hash="$(openssl passwd -6 "${main_user_password}")"
	local root_user_password_hash="$(openssl passwd -6 "${root_user_password}")"


	util_error_echo
	util_error_echo "## overlay ${THE_PLAN_PROFILE_ROOTFS_DIR_PATH}/etc/shadow"
	util_error_echo

cat > "${THE_PLAN_PROFILE_ROOTFS_DIR_PATH}/etc/shadow" << EOF
root:${root_user_password_hash}:14871::::::
${main_user_name}:${main_user_password_hash}:14871::::::
EOF


	return 0

}

mod_overlay_gshadow () {

	local main_user_name="$(sys_config_main_user_name)"

	util_error_echo
	util_error_echo "## overlay ${THE_PLAN_PROFILE_ROOTFS_DIR_PATH}/etc/gshadow"
	util_error_echo

cat > "${THE_PLAN_PROFILE_ROOTFS_DIR_PATH}/etc/gshadow" << EOF
root:::root
sys:!!::${main_user_name}
network:!!::${main_user_name}
power:!!::${main_user_name}
adm:!!::${main_user_name}
wheel:!!::${main_user_name}
uucp:!!::${main_user_name}
optical:!!::${main_user_name}
scanner:!!::${main_user_name}
rfkill:!!::${main_user_name}
video:!!::${main_user_name}
storage:!!::${main_user_name}
audio:!!::${main_user_name}
users:!!::${main_user_name}
nopasswdlogin:!::${main_user_name}
autologin:!::${main_user_name}
sambashare:!::${main_user_name}
${main_user_name}:!::
EOF


	return 0

}

##
### Tail: Model / Overlay / permission
################################################################################



################################################################################
### Head: Model / Overlay / locale
##

mod_overlay_locale () {

	mod_overlay_locale_conf

	mod_overlay_localtime

}

mod_overlay_locale_conf () {

	return 0

	util_error_echo
	util_error_echo "install -Dm644 ${THE_PLAN_OVERLAY_DIR_PATH}/etc/locale.conf ${THE_PLAN_PROFILE_ROOTFS_DIR_PATH}/etc/locale.conf"
	install -Dm644 "${THE_PLAN_OVERLAY_DIR_PATH}/etc/locale.conf" "${THE_PLAN_PROFILE_ROOTFS_DIR_PATH}/etc/locale.conf"


	#util_error_echo
	#util_error_echo "install -Dm644 ${THE_PLAN_OVERLAY_DIR_PATH}/etc/locale.gen ${THE_PLAN_PROFILE_ROOTFS_DIR_PATH}/etc/locale.gen"
	#install -Dm644 "${THE_PLAN_OVERLAY_DIR_PATH}/etc/locale.gen" "${THE_PLAN_PROFILE_ROOTFS_DIR_PATH}/etc/locale.gen"


	util_error_echo
	util_error_echo "install -Dm644 ${THE_PLAN_OVERLAY_DIR_PATH}/etc/pacman.d/hooks/40-locale-gen.hook ${THE_PLAN_PROFILE_ROOTFS_DIR_PATH}/etc/pacman.d/hooks/40-locale-gen.hook"
	install -Dm644 "${THE_PLAN_OVERLAY_DIR_PATH}/etc/pacman.d/hooks/40-locale-gen.hook" "${THE_PLAN_PROFILE_ROOTFS_DIR_PATH}/etc/pacman.d/hooks/40-locale-gen.hook"


}

mod_overlay_localtime () {

	local local_time_file_path="/usr/share/zoneinfo/Asia/Taipei"


	util_error_echo
	util_error_echo "ln -sf ${local_time_file_path} ${THE_PLAN_PROFILE_ROOTFS_DIR_PATH}/etc/localtime"
	ln -sf "${local_time_file_path}" "${THE_PLAN_PROFILE_ROOTFS_DIR_PATH}/etc/localtime"

}

##
### Tail: Model / Overlay / locale
################################################################################


################################################################################
### Head: Model / Overlay / lsb-release
##

mod_overlay_lsb_release () {


	local distro="$(sys_default_distro)"


	mod_overlay_lsb_release_by_distro "$distro"


}

mod_overlay_lsb_release_by_distro () {

	local distro="${1}"

	util_error_echo
	util_error_echo "install -Dm644 ${THE_PLAN_DISTRO_DIR_PATH}/${distro}/asset/overlay/etc/nearbyos-release ${THE_PLAN_PROFILE_ROOTFS_DIR_PATH}/etc/pacman.d/nearbyos-release"
	install -Dm644 "${THE_PLAN_DISTRO_DIR_PATH}/${distro}/asset/overlay/etc/nearbyos-release" "${THE_PLAN_PROFILE_ROOTFS_DIR_PATH}/etc/pacman.d/nearbyos-release"


	util_error_echo
	util_error_echo "install -Dm644 ${THE_PLAN_DISTRO_DIR_PATH}/${distro}/asset/overlay/etc/pacman.d/hooks/50-lsb-release.hook ${THE_PLAN_PROFILE_ROOTFS_DIR_PATH}/etc/pacman.d/hooks/50-lsb-release.hook"
	install -Dm644 "${THE_PLAN_DISTRO_DIR_PATH}/${distro}/asset/overlay/etc/pacman.d/hooks/50-lsb-release.hook" "${THE_PLAN_PROFILE_ROOTFS_DIR_PATH}/etc/pacman.d/hooks/50-lsb-release.hook"


}

##
### Tail: Model / Overlay / lsb-release
################################################################################


################################################################################
### Head: Model / Overlay / profiledef.sh
##

mod_overlay_profiledef () {


	local distro="$(sys_default_distro)"


	mod_overlay_profiledef_by_distro "$distro"


}

mod_overlay_profiledef_by_distro () {

	local distro="${1}"

	util_error_echo
	util_error_echo "install -Dm755 ${THE_PLAN_DISTRO_DIR_PATH}/${distro}/asset/build/profiledef.sh ${THE_PLAN_PROFILE_DIR_PATH}/profiledef.sh"
	install -Dm755 "${THE_PLAN_DISTRO_DIR_PATH}/${distro}/asset/build/profiledef.sh" "${THE_PLAN_PROFILE_DIR_PATH}/profiledef.sh"

}

mod_overlay_profiledef_default () {


	util_error_echo
	util_error_echo "install -Dm755 ${THE_PLAN_BUILD_DIR_PATH}/profiledef.sh ${THE_PLAN_PROFILE_DIR_PATH}/profiledef.sh"
	install -Dm755 "${THE_PLAN_BUILD_DIR_PATH}/profiledef.sh" "${THE_PLAN_PROFILE_DIR_PATH}/profiledef.sh"


	return 0

}

##
### Tail: Model / Overlay / profiledef.sh
################################################################################


################################################################################
### Head: Model / Overlay / package
##

mod_overlay_package () {

	mod_overlay_pacman_conf
	mod_overlay_packages_comment
	mod_overlay_packages_x86_64

}



##
### Tail: Model / Overlay / package
################################################################################


################################################################################
### Head: Model / Overlay / pacman.conf
##

mod_overlay_pacman_conf () {


	util_error_echo
	util_error_echo "install -Dm644 ${THE_PLAN_BUILD_DIR_PATH}/pacman.conf ${THE_PLAN_PROFILE_DIR_PATH}/pacman.conf"
	install -Dm644 "${THE_PLAN_BUILD_DIR_PATH}/pacman.conf" "${THE_PLAN_PROFILE_DIR_PATH}/pacman.conf"


	return 0


	util_error_echo
	util_error_echo "install -Dm644 ${THE_PLAN_OVERLAY_DIR_PATH}/etc/pacman.conf ${THE_PLAN_PROFILE_ROOTFS_DIR_PATH}/etc/pacman.conf"
	install -Dm644 "${THE_PLAN_OVERLAY_DIR_PATH}/etc/pacman.conf" "${THE_PLAN_PROFILE_ROOTFS_DIR_PATH}/etc/pacman.conf"


}

##
### Tail: Model / Overlay / pacman.conf
################################################################################


################################################################################
### Head: Model / Overlay / packages.x86_64 / comment
##

mod_overlay_packages_comment () {

	mod_overlay_packages_comment_grml-zsh-config

}

mod_overlay_packages_comment_grml-zsh-config () {

	util_error_echo
	util_error_echo "sed -i 's/^grml-zsh-config/#grml-zsh-config/g' ${THE_PLAN_PROFILE_DIR_PATH}/packages.x86_64"
	sed -i 's/^grml-zsh-config/#grml-zsh-config/g' "${THE_PLAN_PROFILE_DIR_PATH}/packages.x86_64"

	return 0

}

##
### Tail: Model / Overlay / packages.x86_64 / comment
################################################################################



################################################################################
### Head: Model / Overlay / packages.x86_64
##

mod_overlay_packages_x86_64 () {

	#mod_overlay_packages_bundle_base
	#mod_overlay_packages_bundle_xfce

	local distro="$(sys_default_distro)"


	mod_overlay_packages_by_distro "$distro"


}


mod_overlay_packages_by_distro () {

	local distro="${1}"

	util_error_echo
	util_error_echo "cat ${THE_PLAN_DISTRO_DIR_PATH}/${distro}/asset/package/package-list.txt >> ${THE_PLAN_PROFILE_DIR_PATH}/packages.x86_64"
	cat "${THE_PLAN_DISTRO_DIR_PATH}/${distro}/asset/package/package-list.txt" >> "${THE_PLAN_PROFILE_DIR_PATH}/packages.x86_64"

	return 0

}

mod_overlay_packages_bundle_base () {

	util_error_echo
	util_error_echo "cat ${THE_PLAN_PACKAGE_BUNDLE_DIR_PATH}/base/package-list.txt >> ${THE_PLAN_PROFILE_DIR_PATH}/packages.x86_64"
	cat "${THE_PLAN_PACKAGE_BUNDLE_DIR_PATH}/base/package-list.txt" >> "${THE_PLAN_PROFILE_DIR_PATH}/packages.x86_64"

	return 0

}


mod_overlay_packages_bundle_xfce () {

	util_error_echo
	util_error_echo "cat ${THE_PLAN_PACKAGE_BUNDLE_DIR_PATH}/xfce/package-list.txt >> ${THE_PLAN_PROFILE_DIR_PATH}/packages.x86_64"
	cat "${THE_PLAN_PACKAGE_BUNDLE_DIR_PATH}/xfce/package-list.txt" >> "${THE_PLAN_PROFILE_DIR_PATH}/packages.x86_64"

	return 0

}

##
### Tail: Model / Overlay / packages.x86_64
################################################################################


################################################################################
### Head: Model / Overlay / systemd
##

mod_overlay_systemd () {

	mod_overlay_systemd_service_disable

	mod_overlay_systemd_service_enable


}

mod_overlay_systemd_service_disable () {


	return 0

}

mod_overlay_systemd_service_enable () {

	mod_overlay_service_display_manager_enable

	mod_overlay_service_network_manager_enable

	return 0

}

##
### Tail: Model / Overlay / systemd
################################################################################


################################################################################
### Head: Model / Overlay / display manager
##

mod_overlay_service_display_manager_enable () {

	mod_overlay_service_display_manager_lightdm_enable

}

mod_overlay_service_display_manager_lightdm_enable () {

	local service_display_manager_file_path="/usr/lib/systemd/system/lightdm.service"

	util_error_echo
	util_error_echo "ln -sf ${service_display_manager_file_path} ${THE_PLAN_PROFILE_ROOTFS_DIR_PATH}/etc/systemd/system/display-manager.service"
	ln -sf "${service_display_manager_file_path}" "${THE_PLAN_PROFILE_ROOTFS_DIR_PATH}/etc/systemd/system/display-manager.service"

	## sudo ln -sf /usr/lib/systemd/system/lightdm.service /etc/systemd/system/display-manager.service


}

##
### Tail: Model / Overlay / display manager
################################################################################


################################################################################
### Head: Model / Overlay / network manager
##

mod_overlay_service_network_manager_enable () {

	mod_overlay_service_network_manager_main_enable

}

mod_overlay_service_network_manager_main_enable () {

	local service_network_manager_file_path="/usr/lib/systemd/system/NetworkManager.service"

	util_error_echo
	util_error_echo "ln -sf ${service_network_manager_file_path} ${THE_PLAN_PROFILE_ROOTFS_DIR_PATH}/etc/systemd/system/multi-user.target.wants/NetworkManager.service"
	ln -sf "${service_network_manager_file_path}" "${THE_PLAN_PROFILE_ROOTFS_DIR_PATH}/etc/systemd/system/multi-user.target.wants/NetworkManager.service"

	## sudo ln -sf /usr/lib/systemd/system/NetworkManager.service /etc/systemd/system/multi-user.target.wants/NetworkManager.service


}

##
### Tail: Model / Overlay / network manager
################################################################################




################################################################################
### Head: Main
##

__main__ () {

	sys_root_user_required
	sys_signal_bind
	mod_sys_build

}

__main__

##
### Tail: Main
################################################################################
