export EDITOR="nvim"
export TERMINAL="alacritty"
export BROWSER="firefox"

# Export LESS Colors
export LESS_TERMCAP_mb=$'\e[1;36m'     # begin bold
export LESS_TERMCAP_md=$'\e[1;36m'     # begin blink
export LESS_TERMCAP_so=$'\e[1;32m'     # begin reverse video
export LESS_TERMCAP_us=$'\e[4;33m'     # begin underline
export LESS_TERMCAP_me=$'\e[0m'        # reset bold/blink
export LESS_TERMCAP_se=$'\e[0m'        # reset reverse video
export LESS_TERMCAP_ue=$'\e[0m'        # reset underline
export MANPAGER="less -R"
export MANROFFOPT="-P -c"

# Export clipmenu variables
export CM_LAUNCHER=rofi
export CM_HISTLENGTH=7
export CM_MAX_CLIPS=50

# Others
export "MICRO_TRUECOLOR=1"

# Export fzf theme
export FZF_DEFAULT_OPTS=" \
--color=bg+:#414559,bg:#303446,spinner:#f2d5cf,hl:#e78284 \
--color=fg:#c6d0f5,header:#e78284,info:#ca9ee6,pointer:#f2d5cf \
--color=marker:#f2d5cf,fg+:#c6d0f5,prompt:#ca9ee6,hl+:#e78284"
