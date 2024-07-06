# Custom functions---------------------------------
# Search files and folders using fzf
function fd {
    base="$(find ~/Documents/ ~/Downloads/ ~/dots/ ~/Pictures ~/nsync ~/archives ! -path '*/.*' -type d | cut -d '/' -f4- |fzf -i --reverse --header='Search folders')"
    file="$HOME/$base"
    cd "$file"
}
#----------------------------------------------------

