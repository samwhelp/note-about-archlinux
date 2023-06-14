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
	@echo '	$$ make build'
	@echo
	@echo '	$$ make install'
	@echo

.PHONY: help


prepare:
	sudo pacman -Sy --needed base-devel
.PHONY: prepare


build:
	./build.sh
.PHONY: build


install:
	sudo pacman -U --needed *.zst
.PHONY: install


reinstall:
	sudo pacman -U *.zst
.PHONY: reinstall


uninstall:
	sudo pacman -R demo-hello
.PHONY: uninstall

clean:
	rm -f *.zst
	rm -rf pkg
	rm -rf src
.PHONY: clean


list:
	pacman -Ql demo-hello -q
.PHONY: list

info:
	pacman -Qi demo-hello
.PHONY: info

