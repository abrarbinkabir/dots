#!/usr/bin/env bash

killall polybar
# Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

# Launch mybar
polybar mybar 2>&1 | tee -a /tmp/mybar.log & disown
