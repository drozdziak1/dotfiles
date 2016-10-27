#!/bin/sh

DIRS=~/cubiware
LOCK_FILE=~/.backup_in_progress
# Studia
if [ ! -e $LOCK_FILE ]; then
	touch $LOCK_FILE
	rm $LOCK_FILE
fi
