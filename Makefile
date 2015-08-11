.PHONY: build

SHELL := /bin/bash
NO_COLOR    = \x1b[0m
OK_COLOR    = \x1b[32;01m

build:
		@echo -e "${OK_COLOR}>>> Creating egg-cache for deploy, please be patient...${NO_COLOR}"
			@docker run -it -v ${PWD}/build:/data pap3 /build/create.sh
			]]
