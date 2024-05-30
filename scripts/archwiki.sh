 #!/usr/bin/env bash

# Specifies theme path
theme="$HOME/.config/rofi/config.rasi"

rofi_cmd() {
		rofi -theme-str "window {width: 800px;}" \
		-dmenu -i \
		-p "ArchWiki" \
		-sort \
		-sorting-method fzf \
		-markup-rows \
		-theme "$theme"
		}
		
# Specifies the directory where html wikidocs are stored
wikidir="/usr/share/doc/arch-wiki/html/en/"

wikipages() {
    wikidocs="$(find ${wikidir} -iname "*.html")"
    choice=$(printf '%s\n' "${wikidocs[@]}" \
        | cut -d '/' -f8- \
        | sed -e 's/_/ /g' -e 's/.html//g' \
        | sort -g \
        | rofi_cmd ) || exit 1

    if [ "$choice" ]; then
        article=$(printf '%s\n' "${wikidir}${choice}.html" | sed 's/ /_/g')
        firefox "$article"
    else
        echo "Program terminated." && exit 0
    fi
}

wikipages
