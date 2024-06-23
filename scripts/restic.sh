#!/bin/bash

restic backup --verbose\
    --files-from="$HOME/.config/restic/include.txt" \
    --exclude-file="$HOME/.config/restic/exclude.txt" \ &&
restic forget --verbose\
    --keep-daily 3 \
    --keep-weekly 4 \
    --keep-monthly 6 \
    --prune &&
notify-send -u normal -a Restic -i backup -t 5000 "Backup successful"
