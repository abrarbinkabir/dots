#!/usr/bin/env bash
rofi_cmd() {
	rofi -theme-str "mainbox {children: [ "message", "inputbar", "listview" ]; }" \
		-theme-str "listview {lines: 0;}" \
        -dmenu -i \
        -mesg "Search ManPages" \ 
		}

rofi_cmd | xargs alacritty -e man

