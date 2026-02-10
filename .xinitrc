#!/bin/sh
setxkbmap  -variant dvorak
xrdb -merge ~/.Xresources
xwallpaper --stretch ~/wallpaper.jpg
dwmblocks &
exec dwm
