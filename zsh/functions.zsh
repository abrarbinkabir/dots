# Custom functions---------------------------------
# Search files and folders using fzf
function fd {
    base="$(find ~/Documents/ ~/Downloads/ ~/Pictures/ ~/dots/ ! -path '*/.*' ! -path '~/Documents/archives*' | sort | cut -d '/' -f4- |fzf -e -i --reverse --header='Search files and folders')"
    file="$HOME/$base"
    case $(file --mime-type "$file" -bL) in
        text/*|application/json) $EDITOR "$file";;
        inode/directory) cd "$file";;
        *) xdg-open "$file" ;;
     esac
;}
#----------------------------------------------------

