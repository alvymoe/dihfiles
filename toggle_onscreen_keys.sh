#!/bin/bash
# Check if wvkbd is already running
if pgrep -x "wvkbd-deskintl" > /dev/null; then
    pkill -x "wvkbd-deskintl"
else
    # Launch with a custom layout and height (adjust -L to your preference)
    wvkbd-deskintl -o &
fi
