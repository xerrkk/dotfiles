#!/bin/sh
setxkbmap -variant dvorak 
xrdb -merge ~/.Xresources
xrandr --dpi 125
picom -b
exec i3
