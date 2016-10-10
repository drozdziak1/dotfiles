#!/bin/sh

LOCK_FILE=~/.backup_in_progress
# Studia
if [ ! -e $LOCK_FILE ]; then
	touch $LOCK_FILE
	unison -batch ~/Studia ssh://drozdziak1@vps//opt/backup/Studia
	rm $LOCK_FILE
fi
