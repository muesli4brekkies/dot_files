#!/bin/bash
#
# Very simple script to send a notification when backlight brightness is dvisible by 5 (to stop the notifications stepping on each other)
#
# Simply run when XF86MonBrightnessUp/Down are pressed
#
brval="$(cat /sys/class/backlight/acpi_video0/brightness)"
if [ $(expr $brval % 5) = "0" ]; then
	dunstify "Brightness = $brval%"  -t 1000
fi
