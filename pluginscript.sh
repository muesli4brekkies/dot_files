#!/bin/sh -e
# 
# A script that sounds chimes on AC power being plugged in and out
# Set running with your .xinitrc or favourite DE or WM

prev=0
sleep 6 # Little sleep so the charging sounds don't step on any login sounds
while : ; do
status=$(cat /sys/class/power_supply/AC0/online)
if [ $status -gt $prev ] ; then
    mpv /usr/share/sounds/plugin.ogg # Change this path to your sounds
    dunstify "Charging!" -t 2000
elif [ $status -lt $prev ] ; then 
    mpv /usr/share/sounds/plugout.ogg # As above
    dunstify "NOT Charging!" -t 2000 
fi
prev=$status
sleep 1
done

