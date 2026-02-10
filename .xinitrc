#!/bin/sh
setxkbmap  -variant dvorak
xrdb -merge ~/.Xresources
exec dwm
