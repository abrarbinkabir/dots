#!/bin/bash

week_number=$(date +%U)
journal_file="$HOME/Documents/50-notes/60-journal/week-${week_number}.md"
today=$(date +%Y-%m-%d)

if  [[ ! -f $journal_file ]]; then
    echo "# Journal for Week-${week_number}" > "$journal_file"
fi

if ! grep -c "$today" "$journal_file"; then
    alacritty -e nvim -c "norm Go" \
         -c "norm o## $today" \
         -c "norm o" \
         -c "startinsert" "$journal_file"
else
    alacritty -e nvim -c "norm Go" -c "startinsert" "$journal_file"
fi
