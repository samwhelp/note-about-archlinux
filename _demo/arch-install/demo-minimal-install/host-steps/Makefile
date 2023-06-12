

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
	@echo '	$$ make partition-create'
	@echo
	@echo '	$$ make install'
	@echo

.PHONY: help


prepare:
	@$(THE_PLAN_DIR_PATH)/prepare.sh
.PHONY: prepare


partition-create:
	@$(THE_PLAN_DIR_PATH)/partition-create.sh
.PHONY: partition-create




##
## ## include
##

#include $(THE_MAK_DIR_PATH)/*.mk
