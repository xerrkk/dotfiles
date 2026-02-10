#!/bin/sh
setxkbmap  -variant dvorak
xrdb -merge ~/.Xresources
xwallpaper --stretch ~/wallpaper.jpg
dwmblocks &
picom -b
xrandr --output HDMI-1 --mode 1920x1080 --rate 75.00 
exec dwm
