base="/home/abrar/"
res="$(find ~/Documents/ ~/Downloads/ ! -path '*/.*' ! -path '/home/abrar/Documents/archives*' | cut -d '/' -f4- |fzf -e -i --reverse --header='Search files and folders')"
file="$base$res"
case $(file --mime-type "$file" -bL) in
    text/*|application/json) $EDITOR "$file";;
    inode/directory) go_to;;
    *) xdg-open "$file" ;;
 esac

