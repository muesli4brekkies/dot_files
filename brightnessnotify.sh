#!/bin/bash
#
# Detects if BT audio is available and autoswitches sink there so volume hotkeys work
#
#
#
brval="$(cat /sys/class/backlight/acpi_video0/brightness)"
if [ $(expr $brval % 5) = "0" ]; then
	dunstify "Brightness = $brval%"  -t 1000
fi
