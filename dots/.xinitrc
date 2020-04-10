xsetroot -solid black
compton &
setxkbmap -option -variant altgr-intl && killall xcape 2>/dev/null ; xcape -e 'Super_L=Escape'
dwmbar &
mpc clear ; mpc ls | mpc add
exec dwm
#exec bspwm
