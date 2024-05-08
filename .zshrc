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

# Enables colors
autoload -Uz colors && colors

# Shows Git info
autoload -Uz vcs_info
precmd() { vcs_info }
precmd_functions+=( precmd_vcs_info )
setopt prompt_subst
zstyle ':vcs_info:git:*' formats ' %b '

# Changes zsh prompt
PROMPT='%B%F{cyan}%U%~%u%f %F{yellow}${vcs_info_msg_0_}%f%F{cyan}󱞩%f%b '
RPROMPT='%B%F{cyan}%*%f%b'

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
alias dt="date +%Y%m%d"

# Function for searching files and folders using fzf
function fd {
    base="/home/abrar/"
    res="$(find ~/Documents/ ~/Downloads/ ! -path '*/.*' ! -path '/home/abrar/Documents/archives*' | sort | cut -d '/' -f4- |fzf -e -i --reverse --header='Search files and folders')"
    file="$base$res"
    case $(file --mime-type "$file" -bL) in
        text/*|application/json) $EDITOR "$file";;
        inode/directory) cd "$file" && ls;;
        *) xdg-open "$file" ;;
     esac
;}

# yt-dlp aliases
alias yt="yt-dlp"
alias yta="yt-dlp -f 'bestaudio[ext=m4a]'"
alias ytp="yt-dlp -o '/home/abrar/no-sync/%(playlist)s/%(playlist_index)s-%(title)s.%(ext)s'"

# Pacman aliases
alias Syu="sudo pacman -Syyu"
alias Ss="pacman -Ss"
alias S="sudo pacman -S"
alias Qet="pacman -Qet"
alias Rns="sudo pacman -Rns"

# Zsh plugins
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh 2>/dev/null
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh 2>/dev/null
source /usr/share/zsh/plugins/zsh-history-substring-search/zsh-history-substring-search.zsh 2>/dev/null

# fzf theme
export FZF_DEFAULT_OPTS=" \
--color=bg+:#ccd0da,bg:#eff1f5,spinner:#dc8a78,hl:#d20f39 \
--color=fg:#4c4f69,header:#d20f39,info:#8839ef,pointer:#dc8a78 \
--color=marker:#dc8a78,fg+:#4c4f69,prompt:#8839ef,hl+:#d20f39"
