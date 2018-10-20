MAKEFLAGS = --no-builtin-rules --no-builtin-variables --always-make
.DEFAULT_GOAL := help

SHELL  = /usr/bin/env bash

restart:
	sh scripts/restart.sh

alp:
	sudo alp -r --sum --limit=1000 -f $(file)

rotate:
	sh scripts/rotate_alplog.sh

set-slow-log:
	sudo mysql -uroot -e "set global slow_query_log = 1"
	sudo mysql -uroot -e "set global long_query_time = 0"
	sudo mysql -uroot -e "set global log_queries_not_using_indexes = 1"

mysqldumpslow:
	# slow.logはそのインスタンスによって変える
	sudo mysqldumpslow -s t /var/lib/mysql/slow.log > ~/tmp/slow.log
	sudo cp /dev/null /var/lib/mysql/slow.log

restart-mysql:
	sudo /etc/init.d/mysql restart
