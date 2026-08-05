#!/bin/bash

# Define available browsers separated by newlines
browsers="zen-browser
vivaldi
helium-browser"

# Prompt user via dmenu
chosen_browser=$(echo -e "$browsers" | vicinae dmenu -p "Open $1 in:")

# If a browser was selected, launch it with the passed URL/argument
if [ -n "$chosen_browser" ]; then
    $chosen_browser "$1"
fi
