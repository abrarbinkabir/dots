# Enables colors
autoload -Uz colors && colors

# Shows Git info
autoload -Uz vcs_info
precmd() { vcs_info }
precmd_functions+=( precmd_vcs_info )
setopt prompt_subst
zstyle ':vcs_info:git:*' formats ' %b '

# Changes zsh prompt
PROMPT='%B%F{cyan}%U%~%u%f %F{red}${vcs_info_msg_0_}%f%F{cyan}$%f%b '
RPROMPT='%F{cyan}%*%f'

# Configures basic auto/tab complete features:
autoload -Uz compinit
compinit
zstyle ':completion:*' menu select
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS} 

# Configures history settings
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=10000

setopt autocd beep nomatch
bindkey -e

# Configures history substring search options
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down
bindkey '^[[1;5C' forward-word
bindkey '^[[1;5D' backward-word
bindkey '^?' backward-delete-char
bindkey '^[[3~' delete-char
bindkey '^H' backward-delete-word
bindkey '^[[3;5~' delete-word
bindkey -s '^f' 'fd\n'

# Defines aliases
alias ll="ls -lh --color=auto"
alias ls="ls --color=auto"
alias diff='diff --color=auto'
alias grep='grep --color=auto'
alias cp="cp -vr"
alias mv="mv -v"
alias rm="rm -vr"

alias Syu="sudo pacman -Syyu"
alias S="sudo pacman -S"
alias Ss="pacman -Ss"
alias Qet="pacman -Qet"
alias Qi="pacman -Qi"
alias Rns="sudo pacman -Rns"

alias con="cd ~/.config/"
alias loc="cd ~/.local/share"
alias cam="cd ~/camera/"
alias doc="cd ~/Documents/"
alias dwl="cd ~/Downloads/"
alias dot="cd ~/dots/"
alias scr="cd ~/dots/scripts/"
alias nos="cd ~/no-sync/"
alias pic="cd ~/Pictures/"

alias dt="date +%Y%m%d"
alias yt="yt-dlp"
alias yta="yt-dlp -f 'bestaudio[ext=m4a]'"
alias ytp="yt-dlp -o '~/no-sync/%(playlist)s/%(playlist_index)s-%(title)s.%(ext)s'"


# Defines function for searching files and folders using fzf
function fd {
    base="$(find ~/Documents/ ~/Downloads/ ~/Pictures/ ~/dots/ ! -path '*/.*' ! -path '~/Documents/archives*' | sort | cut -d '/' -f4- |fzf -e -i --reverse --header='Search files and folders')"
    file="$HOME/$base"
    case $(file --mime-type "$file" -bL) in
        text/*|application/json) $EDITOR "$file";;
        inode/directory) cd "$file";;
        *) xdg-open "$file" ;;
     esac
;}

# Sources zsh plugins
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh 2>/dev/null
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh 2>/dev/null
source /usr/share/zsh/plugins/zsh-history-substring-search/zsh-history-substring-search.zsh 2>/dev/null
source /usr/share/fzf/key-bindings.zsh 2>/dev/null
source /usr/share/fzf/completion.zsh 2>/dev/null

# Exports $PATH variables
export PATH=$HOME/.config:$PATH
export PATH=$HOME/dots/scripts:$PATH

LS_COLORS='rs=0:di=01;34:ln=01;36:mh=00:pi=40;33:so=01;35:do=01;35:bd=40;33;01:cd=40;33;01:or=40;31;01:mi=00:su=37;41:sg=30;43:ca=30;41:tw=30;42:ow=34;42:st=37;44:ex=01;32:*.tar=01;31:*.tgz=01;31:*.arc=01;31:*.arj=01;31:*.taz=01;31:*.lha=01;31:*.lz4=01;31:*.lzh=01;31:*.lzma=01;31:*.tlz=01;31:*.txz=01;31:*.tzo=01;31:*.t7z=01;31:*.zip=01;31:*.z=01;31:*.dz=01;31:*.gz=01;31:*.lrz=01;31:*.lz=01;31:*.lzo=01;31:*.xz=01;31:*.zst=01;31:*.tzst=01;31:*.bz2=01;31:*.bz=01;31:*.tbz=01;31:*.tbz2=01;31:*.tz=01;31:*.deb=01;31:*.rpm=01;31:*.jar=01;31:*.war=01;31:*.ear=01;31:*.sar=01;31:*.rar=01;31:*.alz=01;31:*.ace=01;31:*.zoo=01;31:*.cpio=01;31:*.7z=01;31:*.rz=01;31:*.cab=01;31:*.wim=01;31:*.swm=01;31:*.dwm=01;31:*.esd=01;31:*.jpg=01;35:*.jpeg=01;35:*.mjpg=01;35:*.mjpeg=01;35:*.gif=01;35:*.bmp=01;35:*.pbm=01;35:*.pgm=01;35:*.ppm=01;35:*.tga=01;35:*.xbm=01;35:*.xpm=01;35:*.tif=01;35:*.tiff=01;35:*.png=01;35:*.svg=01;35:*.svgz=01;35:*.mng=01;35:*.pcx=01;35:*.mov=01;35:*.mpg=01;35:*.mpeg=01;35:*.m2v=01;35:*.mkv=01;35:*.webm=01;35:*.ogm=01;35:*.mp4=01;35:*.m4v=01;35:*.mp4v=01;35:*.vob=01;35:*.qt=01;35:*.nuv=01;35:*.wmv=01;35:*.asf=01;35:*.rm=01;35:*.rmvb=01;35:*.flc=01;35:*.avi=01;35:*.fli=01;35:*.flv=01;35:*.gl=01;35:*.dl=01;35:*.xcf=01;35:*.xwd=01;35:*.yuv=01;35:*.cgm=01;35:*.emf=01;35:*.ogv=01;35:*.ogx=01;35:*.aac=00;36:*.au=00;36:*.flac=00;36:*.m4a=00;36:*.mid=00;36:*.midi=00;36:*.mka=00;36:*.mp3=00;36:*.mpc=00;36:*.ogg=00;36:*.ra=00;36:*.wav=00;36:*.oga=00;36:*.opus=00;36:*.spx=00;36:*.xspf=00;36:';

#original='di=00;36:ex=00;39:*.tar=00;34:*.zip=00;34:*.gz=00;34:*.tar.gz=00;34:*.rar=00;34:*.iso=00;34:*.tar.xz=00;34:*.apk=00;34:*.txt=00;35:*.md=00;35:*.yml=00;35:*.htm=00;35:*.html=00;35:*.css=00;35:*.css=00;35:*.json=00;35:*.py=00;35:*.sql=00;35:*.pdf=00;35:*.epub=00;35:*.djvu=00;35:*.conf=00;35:*.rasi=00;35:*.odt=00;35:*.ods=00;35:*.odp=00;35:*.doc=00;35:*.docx=00;35:*.xlsx=00;35:*.csv=00;35:*.pptx=00;35:*.db=00;35:*.tex=00;35:*.vcf=00;35:*.m4a=00;32:*.mp3=00;32:*.wav=00;32:*.mp4=00;32:*.mkv=00;32:*.webm=00;32:*.avi=00;32:*.png=00;33:*.jpg=00;33:*.jpeg=00;33:*.webp=00;33:*.heic=00;33:*.gif=00;33:*.tif=00;33:*.svg=00;33:*.ai=00;33:*.eps=00;33:*.psd=00;33:*.ps=00;33:*.ttf=00;33:*.otf=00;33:';

export LS_COLORS

# Normal Colors
# Foreground color codes
# Black=30, Red=31, Green=32, Yellow=33, Blue=34, Magenta=35, Cyan=36, White=37, Default=39, Reset=0

# Background color codes
# Black=40, Red=41, Green=42, Yellow=43, Blue=44, Magenta=45, Cyan=46, White=47
# Default=49, Reset=0

# Bright Colors
# Foreground color codes
# Black=90, Red=91, Green=92, Yellow=93, Blue=94, Magenta=95, Cyan=96, White=97
# Background color codes
# Black=100, Red=101, Green=102, Yellow=103, Blue=104, Magenta=105, Cyan=106, White=107
