#!/bin/bash

state=$(systemctl status --user redshift.service | grep "Active:" | cut -d' ' -f 7)

if [ "$state" = 'inactive' ]; then
    systemctl start --user redshift.service &&
    notify-send -u normal -a Redshift -i redshift-on "Started Redshift"
    exit
elif [ "$state" = 'active' ]; then
    systemctl stop --user redshift.service &&
    notify-send -u normal -a Redshift -i redshift-off "Stopped Redshift"
    exit
else
    exit
fi    
