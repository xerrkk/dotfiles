#!/bin/sh
setxkbmap -variant dvorak
xrdb -merge ~/.Xdefaults
xrandr --output HDMI-0 --mode 1920x1080 --rate 75.00
picom -b 
exec awesome
