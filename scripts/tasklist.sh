#!/bin/bash

tasklist_file="$HOME/Documents/50-notes/60-journal/tasklist.md"
if [[ -f "$tasklist_file" && -s "$tasklist_file" ]]; then
    nvim -c 'norm Go- [ ]  ' -c 'startinsert' "$tasklist_file"

elif [[ ! -s "$tasklist_file" ]]; then
    nvim -c 'norm i- [ ]  ' -c 'startinsert' "$tasklist_file"
fi
