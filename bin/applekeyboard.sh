#!/bin/sh
setxkbmap -model 'pc105' -option ""
setxkbmap -model 'pc105' -option 'caps:ctrl_modifier' -option "altwin:swap_alt_win" -layout us $*
xmodmap -e 'keycode 191 = Insert'
