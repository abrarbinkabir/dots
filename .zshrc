# Changes LESS Colors
export LESS_TERMCAP_mb=$'\e[1;36m'     # begin bold
export LESS_TERMCAP_md=$'\e[1;36m'     # begin blink
export LESS_TERMCAP_so=$'\e[01;49;32m' # begin reverse video
export LESS_TERMCAP_us=$'\e[01;33m'    # begin underline
export LESS_TERMCAP_me=$'\e[0m'        # reset bold/blink
export LESS_TERMCAP_se=$'\e[0m'        # reset reverse video
export LESS_TERMCAP_ue=$'\e[0m'        # reset underline
export MANPAGER="less -R"
export MANROFFOPT="-P -c"

# Enables colors and changes prompt:
autoload -Uz colors && colors
PROMPT='%B%F{cyan}[%n@%m]%f%b %U%F{magenta}%~%f%u %B%F{yellow}󱞩%f%b '
RPROMPT='%F{cyan}[%t]%f'

# Basic auto/tab complete:
autoload -Uz compinit
compinit
zstyle ':completion:*' menu select
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS} 

# History
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=10000

setopt autocd beep nomatch
bindkey -e

# history substring search options
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down

# Aliases
alias ll="ls -lah --color=auto"
alias ls="ls --color=auto"
alias con="cd ~/.config/ && ls"
alias doc="cd ~/Documents/ && ls"
alias dot="cd ~/Documents/dotfiles/ && ls"
alias dl="cd ~/Downloads && ls"
alias pic="cd ~/Pictures/ && ls"
alias diff='diff --color=auto'
alias grep='grep --color=auto'

# Plugins
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh 2>/dev/null
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh 2>/dev/null
source /usr/share/zsh/plugins/zsh-history-substring-search/zsh-history-substring-search.zsh 2>/dev/null
