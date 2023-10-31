SHELL=/bin/bash

.PHONY:init
init:
	git submodule update --init --recursive

.PHONY:all
all: build

.PHONY:dev
dev:update
	yarn run start

.PHONY:update
update:
	git restore .
	git pull
	git submodule update --rebase --remote

.PHONY:build
build: update
	yarn
	-pkill node
	yarn run build
	nohup node ./dist/server/entry.mjs &
