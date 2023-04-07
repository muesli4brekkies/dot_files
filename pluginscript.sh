#!/bin/sh -e
prev=0
sleep 6 # Little sleep so the charging sounds don't step on the login sound
while : ; do
status=$(cat /sys/class/power_supply/AC0/online)
if [ $status -gt $prev ] ; then
    mpv /usr/share/sounds/plugin.ogg 
    dunstify "Charging!" -t 2000
elif [ $status -lt $prev ] ; then 
    mpv /usr/share/sounds/plugout.ogg
    dunstify "NOT Charging!" -t 2000 
fi
prev=$status
sleep 1
done

