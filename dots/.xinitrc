systemctl --user import-environment DISPLAY

if [ -d /etc/X11/xinit/xinitrc.d ] ; then
 for f in /etc/X11/xinit/xinitrc.d/?*.sh ; do
  [ -x "$f" ] && . "$f"
 done
 unset f
fi
~/.local/bin/scripts/dwmbar &
/usr/bin/setxkbmap -variant altgr-intl & 
~/.local/bin/scripts/startdwm
