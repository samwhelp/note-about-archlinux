

THE_MAKEFILE_FILE_PATH := $(abspath $(lastword $(MAKEFILE_LIST)))
THE_BASE_DIR_PATH := $(abspath $(dir $(THE_MAKEFILE_FILE_PATH)))
THE_PLAN_DIR_PATH := $(THE_BASE_DIR_PATH)
THE_BIN_DIR_PATH := $(THE_BASE_DIR_PATH)/bin
THE_MAK_DIR_PATH := $(THE_BASE_DIR_PATH)/mak

PATH := $(THE_BIN_DIR_PATH):$(PATH)




default: help
.PHONY: default

help:
	@echo 'Usage:'
	@echo '	$$ make [action]'
	@echo
	@echo 'Example:'
	@echo '	$$ make'
	@echo '	$$ make help'
	@echo
	@echo '	$$ make prepare'
	@echo
	@echo '	$$ make partition'
	@echo
	@echo '	$$ make mount'
	@echo
	@echo '	$$ make system'
	@echo
	@echo '	$$ make fstab'
	@echo
	@echo '	$$ make chroot'
	@echo
	@echo '	$$ make umount'
	@echo

.PHONY: help


prepare:
	@$(THE_PLAN_DIR_PATH)/prepare.sh
.PHONY: prepare


partition:
	@$(THE_PLAN_DIR_PATH)/partition.sh
.PHONY: partition


mount:
	@$(THE_PLAN_DIR_PATH)/mount.sh
.PHONY: mount


system:
	@$(THE_PLAN_DIR_PATH)/system.sh
.PHONY: system


fstab:
	@$(THE_PLAN_DIR_PATH)/fstab.sh
.PHONY: fstab


chroot:
	@$(THE_PLAN_DIR_PATH)/chroot.sh
.PHONY: chroot


umount:
	@$(THE_PLAN_DIR_PATH)/umount.sh
.PHONY: umount


##
## ## include
##

#include $(THE_MAK_DIR_PATH)/*.mk
