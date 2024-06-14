# Keybindings-----------------------------------
bindkey -e
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down
bindkey '^[[1;5C' forward-word
bindkey '^[[1;5D' backward-word
bindkey '^[[H' beginning-of-line
bindkey '^[[F' end-of-line
bindkey '^?' backward-delete-char
bindkey '^[[3~' delete-char
bindkey '^H' backward-delete-word
bindkey '^[[3;5~' delete-word
bindkey '^[[3;3~' kill-whole-line
bindkey -s '^f' 'fd\n'
#-----------------------------------------------

