#!/bin/bash

dir="/mnt/nvme0n1p2"
cd "$dir"
# Remove stale locks quietly
restic -r . unlock >/dev/null 2>&1

# --- Run backup ---
if ! restic -r . backup \
    --files-from="$HOME/.config/restic/include.txt" \
    --exclude-file="$HOME/.config/restic/exclude.txt"; then

    notify-send -u critical -a Restic -i backup "Failed during backup step"
    exit 1
fi

# --- Run forget + prune ---
if ! restic -r . forget \
    --keep-daily 3 \
    --keep-weekly 4 \
    --keep-monthly 12 \
    --prune; then

    notify-send -u critical -a Restic -i backup "Failed during prune step"
    exit 1
fi

# --- All done successfully ---
notify-send -u normal -a Restic -i backup -t 5000 "Backup successful"

