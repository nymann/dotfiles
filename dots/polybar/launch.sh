#!/usr/bin/env bash

# Terminate already running bar instances
pkill polybar

# Wait until the process have been shut down.
while pgrep -u $UID -x polybar >/dev/null; do sleep 0.5; done

for m in $(polybar --list-monitors | cut -d":" -f1); do
    MONITOR=$m polybar mindsphere-top -c ~/.config/polybar/config-top.ini &
done

