# Aliases---------------------------------------
# Set aliases for common shell commands
alias ll="eza --color=always --git -l"
alias la="eza --color=always --git -la"
alias ls="eza --color=always"
alias tree="exa --tree --level=2"
alias diff='diff --color=auto'
alias grep='grep --color=auto'
alias cp="cp -vr"
alias mv="mv -v"
alias rm="rm -vr"
alias dt="date +%Y%m%d"

# Set aliases for pacman
alias Syu="sudo pacman -Syyu"
alias S="sudo pacman -S"
alias Ss="pacman -Ss"
alias Qs="pacman -Qs"
alias Qe="pacman -Qe"
alias Qen="pacman -Qen"
alias Qem="pacman -Qem"
alias Qi="pacman -Qi"
alias Rns="sudo pacman -Rns"

# Set aliases for favorite directories
alias gcf="cd ~/.config/"
alias gls="cd ~/.local/share"
alias gtr="cd ~/.local/share/Trash/files"
alias gar="cd ~/archives"
alias gcm="cd ~/camera"
alias gdc="cd ~/Documents"
alias gnt="cd ~/Documents/50-notes"
alias glx="cd ~/Documents/70-tech/72-linux"
alias gcd="cd ~/Documents/code"
alias gdl="cd ~/Downloads"
alias gdt="cd ~/dots"
alias gms="cd ~/dots/misc"
alias gsc="cd ~/dots/scripts"
alias gns="cd ~/nsync/"
alias gyt="cd ~/nsync/ytdlp"
alias gpc="cd ~/Pictures"
alias gss="cd ~/Pictures/shots"

# Set aliases for yt-dlp
alias yt="yt-dlp"
alias yta="yt-dlp -f 'bestaudio[ext=m4a]'"
alias ytp="yt-dlp -o '~/nsync/ytdlp/%(playlist)s/%(playlist_index)s-%(title)s.%(ext)s'"

# Set other aliases
alias bm="bashmount"
alias vi="nvim"
#--------------------------------------------------

