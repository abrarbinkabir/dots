export EDITOR="micro"
export TERMINAL="alacritty"
export BROWSER="firefox"
export DATE=$(date +%Y%m%d)
export DT=$(date +%m%d)
export "MICRO_TRUECOLOR=1"

# Exports LESS Colors
export LESS_TERMCAP_mb=$'\e[1;36m'     # begin bold
export LESS_TERMCAP_md=$'\e[1;36m'     # begin blink
export LESS_TERMCAP_so=$'\e[1;32m'     # begin reverse video
export LESS_TERMCAP_us=$'\e[4;33m'     # begin underline
export LESS_TERMCAP_me=$'\e[0m'        # reset bold/blink
export LESS_TERMCAP_se=$'\e[0m'        # reset reverse video
export LESS_TERMCAP_ue=$'\e[0m'        # reset underline
export MANPAGER="less -R"
export MANROFFOPT="-P -c"

# Exports clipmenu env variables
export CM_LAUNCHER=rofi
export CM_HISTLENGTH=7
export CM_MAX_CLIPS=30

# Exports fzf theme
export FZF_DEFAULT_OPTS=" \
--color=bg+:#ccd0da,bg:#eff1f5,spinner:#dc8a78,hl:#d20f39 \
--color=fg:#4c4f69,header:#d20f39,info:#8839ef,pointer:#dc8a78 \
--color=marker:#dc8a78,fg+:#4c4f69,prompt:#8839ef,hl+:#d20f39"
