

################################################################################
### Head: Note
##

##
## # config.sh
##

##
### Tail: Note
################################################################################


################################################################################
### Head: Config
##

THE_TARGET_DEVICE="/dev/sdc"
THE_TARGET_ROOT_PARTITION="/dev/sdc2"
THE_TARGET_ROOT_DIR_PATH="/mnt"

#THE_TARGET_PACKAGE_LIST="base linux"
#THE_TARGET_PACKAGE_LIST="base linux linux-firmware"
THE_TARGET_PACKAGE_LIST="base base-devel linux linux-firmware"

THE_TARGET_FSTAB_FILE_PATH="${THE_TARGET_ROOT_DIR_PATH}/etc/fstab"

##
### Tail: Config
################################################################################
