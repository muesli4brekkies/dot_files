#!/bin/sh
while : ; do
keypress=$(xinput query-state 12 | grep down);
if [ -z "$keypress" ]
then
    counter=$(( $counter -1 ))
else
    cat /sys/class/leds/tpacpi::kbd_backlight/brightness_hw_changed  > //sys/class/leds/tpacpi::kbd_backlight/brightness
    counter=25
fi
if [ $counter -lt 0 ]
then
    echo 0 > /sys/class/leds/tpacpi::kbd_backlight/brightness
    counter=0
fi
sleep 0.2
done
