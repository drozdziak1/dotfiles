#!/bin/sh
set +e

export DISPLAY=:0

# Backup $HOME
duplicity ~ file:///opt/backup \
    --no-encryption \
    --progress \
    --full-if-older-than 1W \
    --name "${USER}_home" \
    --exclude "**.cache/**" \
    --exclude "**.rustup/**" \
    --exclude "**.cargo/**" \
    && notify-send -u low -t 5000 "Local backup complete" \
    || notify-send -u critical -t 10000 "Local backup failed"

# Old backup removal
duplicity remove-older-than 2W --force file:///opt/backup \
    && notify-send -u low -t 5000 "Old backup cleanup done" \
    || notify-send -u critical -t 10000 "Old backup cleanup failed"
