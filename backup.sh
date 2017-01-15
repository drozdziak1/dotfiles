#!/bin/sh

LOCK_FILE=~/.backup_in_progress
# Studia
if [ ! -e $LOCK_FILE ]; then
	touch $LOCK_FILE
	unison -batch ~/Studia ssh://drozdziak1@vps//opt/backup/Studia
	unison -batch ~/Samowarzenie ssh://drozdziak1@vps//opt/backup/Samowarzenie
	unison -batch ~/Bitwig\ Studio ssh://drozdziak1@vps//opt/backup/Bitwig\ Studio
	rm $LOCK_FILE
fi
