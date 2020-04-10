xsetroot -solid black
compton &
setxkbmap -option -variant altgr-intl && killall xcape 2>/dev/null ; xcape -e 'Super_L=Escape'
dwmbar &
exec dwm
#exec bspwm
