#!/bin/bash

# Check if the input file exists
if [[ ! -f "${1}.md" ]]; then
    echo "Error: File ${1}.md does not exist."
    exit 1
fi

# Convert Markdown to PDF using Pandoc
pandoc -H ~/.config/pandoc/inline_code.tex \
    -H ~/.config/pandoc/quote.tex \
    --highlight-style ~/.config/pandoc/pygments.theme \
    -V linkcolor:blue \
    -V geometry:a4paper \
    -V geometry:margin=1in \
    -V fontsize=12pt \
    -V pagestyle=empty \
    -V monofont="JetBrainsMono Nerd Font Propo" \
    --from=markdown+lists_without_preceding_blankline \
    -N \
    --toc \
    --pdf-engine=xelatex \
    "${1}.md" \
    -o "${1}.pdf"

# Check if Pandoc succeeded
if [[ $? -eq 0 ]]; then
    echo "Successfully converted ${1}.md to ${1}.pdf"
else
    echo "Error: Failed to convert ${1}.md to ${1}.pdf"
    exit 1
fi
