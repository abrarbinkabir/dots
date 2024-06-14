# Aliases---------------------------------------
# Set aliases for common shell commands
alias ll="ls -lh --color=auto"
alias ls="ls --color=auto"
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
alias Qet="pacman -Qet"
alias Qi="pacman -Qi"
alias Rns="sudo pacman -Rns"

# Set aliases for favorite directories
alias con="cd ~/.config/"
alias loc="cd ~/.local/share"
alias arc="cd ~/archives"
alias cam="cd ~/camera/"
alias doc="cd ~/Documents/"
alias notes="cd ~/Documents/50-notes/"
alias dwl="cd ~/Downloads/"
alias dot="cd ~/dots/"
alias scr="cd ~/dots/scripts/"
alias msc="cd ~/dots/misc/"
alias nos="cd ~/no-sync/"
alias pic="cd ~/Pictures/"

# Set aliases for yt-dlp
alias yt="yt-dlp"
alias yta="yt-dlp -f 'bestaudio[ext=m4a]'"
alias ytp="yt-dlp -o '~/nsync/ytdlp/%(playlist)s/%(playlist_index)s-%(title)s.%(ext)s'"

# Set other aliases
alias bm="bashmount"
#--------------------------------------------------

