#!/bin/bash

pandoc -H ~/.config/pandoc/inline_code.tex \
    -H ~/.config/pandoc/bullet_style.tex \
    -H ~/.config/pandoc/quote.tex \
    --highlight-style ~/.config/pandoc/pygments.theme \
    -V linkcolor:blue \
    -V geometry:a4paper \
    -V geometry:margin=1in \
    -V fontsize=12pt \
    -V pagestyle=empty \
    -V monofont="JetBrainsMono Nerd Font Propo" \
    --pdf-engine=xelatex \
    "${1}.md" \
    -o "${1}.pdf"
