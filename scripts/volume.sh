#!/usr/bin/bash

# Notification for the current volume if volume increases or decreases
volume_notification() {
	# Gets the volume of the default sink >>
	# Filters the line/s containing volume >>
	# Gets the integer value of volume without percentage sign
    volume=$(pactl get-sink-volume @DEFAULT_SINK@ | awk '/Volume/ {print $5}'| cut -d "%" -f 1)
    # Sends a notification showing the volume in progress bar and text
    notify-send -a "Pulseaudio" -u normal -r 9993 -h int:value:"$volume" -i volume-on "Volume set to: ${volume}%"
}

# Notification for mute state
mute_notification(){
	# Checks whether muted or not
	state=$(pactl get-sink-mute @DEFAULT_SINK@ | awk '{print $2}')
	# Sends notification
	if [ "$state" == 'yes' ]; then
		dunstify -a "Pulseaudio" -u normal -r 9993 -i volume-mute "Default sink muted"
	else
		dunstify -a "Pulseaudio" -u normal -r 9993 -i volume-on "Default sink unmuted"
	fi
	}

# Takes action depending on parameter
case $1 in
    up) 
        # Unmutes
        pactl set-sink-mute @DEFAULT_SINK@ 0
        # Increases volume by 5%
        pactl set-sink-volume @DEFAULT_SINK@ +5%
        # Sends notification
        volume_notification
        ;;
        
    down)
        # Unmutes
        pactl set-sink-mute @DEFAULT_SINK@ 0
        # Decreses volume by 5%
        pactl set-sink-volume @DEFAULT_SINK@ -5%
        # Sends notification
        volume_notification
	    ;;
	    
    mute)
    	# Toggles mute state
        pactl set-sink-mute @DEFAULT_SINK@ toggle
        # Sends notification
        mute_notification
        ;;
    *)
        echo "Usage: $0 up | down | mute"
        ;;
esac

