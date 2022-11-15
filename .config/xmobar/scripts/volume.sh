#!/bin/sh

dunstify -t 300 \
  "Volume: $(printf "%03d%%" $(pamixer --get-volume))" \
  -i "/usr/share/icons/Papirus/16x16/devices/audio-card.svg" \
  -r 28223 \
  -h int:value:$(pamixer --get-volume)
