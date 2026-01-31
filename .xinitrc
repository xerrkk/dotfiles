#!/bin/sh
setxkbmap -variant dvorak
xrdb -merge ~/.Xdefaults
picom -b 
exec awesome
