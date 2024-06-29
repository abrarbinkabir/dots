#!/bin/bash

# Configuration variables
theme="$HOME/.config/rofi/config.rasi"
wikidir="/usr/share/doc/arch-wiki/html/en/"
browser="qutebrowser"

# Function to display Rofi menu and select ArchWiki article
rofi_cmd() {
		rofi -theme-str "window {width: 800px;}" \
		-dmenu -i \
		-p "ArchWiki" \
		-sort \
		-sorting-method fzf \
		-markup-rows \
		-theme "$theme"
		}
		
main() {
    wikidocs="$(find ${wikidir} -iname "*.html")"
    selection=$(printf '%s\n' "${wikidocs[@]}" \
        | cut -d '/' -f8- \
        | sed -e 's/_/ /g' -e 's/.html//g' \
        | sort -g \
        | rofi_cmd ) || exit 1

    if [ "$selection" ]; then
        article=$(printf '%s\n' "${wikidir}${selection}.html" | sed 's/ /_/g')
        "$browser" "$article"
    fi
}

main
