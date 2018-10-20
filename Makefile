MAKEFLAGS = --no-builtin-rules --no-builtin-variables --always-make
.DEFAULT_GOAL := help

SHELL  = /usr/bin/env bash

restart:
	sh scripts/restart.sh
