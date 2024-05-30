#!/usr/bin/env bash

# Specifies Theme
theme="$HOME/.config/rofi/applet-config.rasi"

mesg="Date and Time"

# Gets current time, date, weekday and week number
# %I->Hour (00-12), %H->Hour (00-23), %M->Minute (00-59), %S->Second (00-59), %p->AM/PM
now=$(date '+%I:%M %p')
# %d->Day of month (01-31), %b->Month name (short version), %B->Month name (full version), %m->Month as a number (01-12), %y->Year (short version, without century), %Y 	Year (full version)
today=$(date '+%B %d, %Y')
# %a->Weekday (short version), %A->Weekday (full version), %w->Weekday as a number (0-6); 0 is Sunday
weekday=$(date '+%A')
# %U->Week number of year, Sunday as the first day of week, 00-53
weeknum=$(date '+%U')

# Options
option_1=" Now: $now"
option_2=" Today: $today"
option_3=" Weekday: $weekday"
option_4=" Week No: $weeknum"
# option_5="Today: $bs_mo $bs_dt, $bs_yr Bongabdo"

# Rofi CMD
rofi_cmd() {
   rofi -theme-str 'listview {columns: 1; lines: 4;}' \
		-dmenu \
		-mesg "$mesg" \
		-markup-rows \
		-theme "$theme"
}

# Passes options to rofi dmenu
run_rofi() {
	echo -e "$option_1\n$option_2\n$option_3\n$option_4" | rofi_cmd
}

run_rofi > /dev/null 2&>1
