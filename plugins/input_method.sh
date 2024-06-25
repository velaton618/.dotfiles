#!/usr/bin/env bash

CURRENT_INPUT=$(defaults read ~/Library/Preferences/com.apple.HIToolbox.plist AppleSelectedInputSources | egrep -w 'KeyboardLayout Name' | awk -F ' = ' '{print $2}' | sed 's/[\";]//g')

echo "$CURRENT_INPUT"

sketchybar --set input_method label="$CURRENT_INPUT"

