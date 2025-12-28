#!/bin/bash
DIR="$HOME/Pictures/Screenshots"
mkdir -p "$DIR"
FILENAME="$DIR/$(date +%Y-%m-%d-%H%M%S).png"
grim -g "$(slurp -d)" "$FILENAME" && wl-copy < "$FILENAME" && notify-send "Screenshot saved" "$FILENAME"
