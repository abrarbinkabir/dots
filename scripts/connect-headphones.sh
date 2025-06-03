#!/bin/sh

mac="84:AC:60:87:B1:5A"
sink="bluez_sink.84_AC_60_87_B1_5A.a2dp_sink"

bluetoothctl power on &
bluetoothctl connect $mac &
pulseaudio -k && pulseaudio --start &
pactl set-default-sink $sink &
