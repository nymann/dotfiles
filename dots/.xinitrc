#!/usr/bin/env sh
xrandr --setprovideroutputsource modesetting NVIDIA-0
xrandr --output DP-0 --mode 5120x1440 --rate 120

systemctl --user import-environment DISPLAY
if [ -d /etc/X11/xinit/xinitrc.d ] ; then
    for f in /etc/X11/xinit/xinitrc.d/?*.sh ; do
        [ -x "$f" ] && . "$f"
    done
    unset f
fi

xinput --set-prop $(xinput list | awk '/Logitech G Pro.*slave  pointer/ { print $6 }' | sed 's#id=##') 'libinput Accel Speed' -0.5
~/.local/bin/scripts/dwmbar &
feh --bg-center ~/pics/background.jpg &
systemctl --user start unclutter
~/.local/bin/scripts/startdwm
