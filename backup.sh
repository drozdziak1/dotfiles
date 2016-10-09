#!/bin/sh

LOCK_FILE=/home/drozdziak1/.backup_in_progress
# Studia
if [ ! -e $LOCK_FILE ]; then
	touch $LOCK_FILE
	rsync -a --info=progress2 --numeric-ids /home/drozdziak1/Studia drozdziak1@vps:/opt/backup
	rm $LOCK_FILE
fi
