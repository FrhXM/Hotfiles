#!/bin/sh
killall trayer
trayer --edge top --align right --SetDockType true --SetPartialStrut true --expand true \
       --height 30 --distance 3 --width 250 --margin 16 --alpha 20 --tint 0x11121D \
       --transparent true --widthtype request 
