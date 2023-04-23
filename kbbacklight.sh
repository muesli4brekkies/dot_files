#!/bin/sh

# Fun little script for turning laptop keyboard backlight LEDs on and off responsively

while : ; do
# Polls xinput query-state for if a key is pressed. "12" corresponds to the keyboard on my hardware, this will need to be adjusted for your hardware - see 'xinput list'
keypress=$(xinput query-state 12 | grep down);

if [ -z "$keypress" ]
then
    counter=$(( $counter -1 )) # If keypress is empty then decrement counter.
else
    cat /sys/class/leds/tpacpi::kbd_backlight/brightness_hw_changed  > //sys/class/leds/tpacpi::kbd_backlight/brightness 
# If keypress populated, cat hardware brightness level to brightness file. This path will change based on hardware (asus:: rather than tpacpi:: for instance)
    counter=25 # Change this value to adjust the timeout duration
fi
if [ $counter -lt 0 ]
then
    echo 0 > /sys/class/leds/tpacpi::kbd_backlight/brightness # If counter less than 0, turn off keyboard leds
    counter=0 # Set counter to 0 to avoid variable walking off into negative infinity 
fi
sleep 0.2 # Adjust this value to change polling rate (currently 1/5 second)
done
