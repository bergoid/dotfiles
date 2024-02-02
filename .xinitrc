VBoxClient --display
VBoxClient --clipboard
xrandr --output Virtual1 --mode 1920x1080
setxkbmap be
numlockx &
unclutter -jitter 2 -noevents -root &
test -f "$HOME/.xinit.local" && . "$HOME/.xinit.local"
exec dwm
