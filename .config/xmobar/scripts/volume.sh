#!/bin/bash

dunstify \
  "Volume: $(printf "%03d%%" $(pamixer --get-volume))" \
  -i volume-level-high \
  -r 28223 \
  -h int:value:$(pamixer --get-volume)

