#!/bin/bash
up=$(uptime -p | awk '{print ($2 * 60) + $4}')
now=$(( ($(date '+%H') * 60) + $(date '+%M')))
today=$(date '+%Y%m%d')
yesterday=$(date -d "yesterday" '+%Y%m%d')

main() {
	if [[ "$now" -ge "$up" ]] ; then
		echo -e "$today\t$up" >> ~/Documents/70-tech/71-linux/uptime-record.csv
	else
		up_yesterday=$(( $up - $now))
		echo -e "$yesterday\t$up_yesterday" >> ~/Documents/70-tech/71-linux/uptime-record.csv
		echo -e "$today\t$now" >> ~/Documents/70-tech/71-linux/uptime-record.csv
	fi
}

main
