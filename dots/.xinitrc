if [ -d /etc/X11/xinit/xinitrc.d ] ; then
 for f in /etc/X11/xinit/xinitrc.d/?*.sh ; do
  [ -x "$f" ] && . "$f"
 done
 unset f
fi
compton &
setxkbmap -option caps:esc -variant altgr-intl & 
~/.local/bin/scripts/dwmbar &
~/.local/bin/scripts/workrandr
~/.local/bin/scripts/startdwm
