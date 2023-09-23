#!/bin/sh

layout(){
	setxkbmap -query | awk '/layout/ {print $2}'
	}

case "$(layout)" in
  us) 
  setxkbmap -layout bd -variant probhat
  dunstify -u normal -a 'Keyboard Layout' -i bangla --replace=990 "Layout changed to Bangla (probhat)"
  
   ;;
  bd) 
  setxkbmap us
  dunstify -u normal -a 'Keyboard Layout' -i english --replace=991 "Layout changed to English (US)"
  ;;
  *) 
  setxkbmap us
  dunstify -u normal -a 'Keyboard Layout' -i english --replace=992 "Layout changed to English (US)"
   ;;
esac

