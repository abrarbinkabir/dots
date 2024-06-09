#!/bin/bash

directory="/run/media/abrar/team-c175"

if [ ! -d "$directory" ]; then
	udisksctl mount -b /dev/sdb1 > /dev/null 2>&1
fi

cd $directory &&
restic -r . backup \
	--files-from="$HOME/.config/restic/include.txt" \
	--exclude-file="$HOME/.config/restic/exclude.txt"  &&
restic -r . unlock &&
restic -r . forget \
	--keep-last 3 \
	--prune
	
