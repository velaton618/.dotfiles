#!/usr/bin/env bash

CURRENT_INPUT=$(defaults read ~/Library/Preferences/com.apple.HIToolbox.plist AppleSelectedInputSources | egrep -w 'KeyboardLayout Name' | awk -F ' = ' '{print $2}' | sed 's/[\";]//g')

if [[ "$CURRENT_INPUT" == *"U.S."* ]]; then
  LABEL="  EN"
elif [[ "$CURRENT_INPUT" == *"Russian"* ]]; then
  LABEL="  RU"
elif [[ "$CURRENT_INPUT" == *"Ukrainian"* ]]; then
  LABEL="  UA"
elif [[ -z "$CURRENT_INPUT" ]]; then
  LABEL="  CN"
else
  LABEL="$CURRENT_INPUT"
fi

sketchybar --set input_method label="$LABEL"

