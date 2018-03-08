#!/bin/sh

# Backup $HOME
duplicity ~ file:///opt/backup \
    --no-encryption \
    --progress \
    --full-if-older-than 1W \
    --name "${USER}_home" \
    --exclude "**.cache/**" \
    --exclude "**.rustup/**" \
    && notify-send -u low -t 5000 "Local backup complete" \
    || notify-send -u critical -t 10000 "Local backup failed"

# Old backup removal
duplicity remove-older-than 1M --force file:///opt/backup \
    && notify-send -u low -t 5000 "Old backup cleanup done" \
    || notify-send -u critical -t 10000 "Old backup cleanup failed"
