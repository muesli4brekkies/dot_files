#!/bin/sh

# Fun little script for turning laptop keyboard backlight LEDs on and off responsively
# Requires permissions to write to brightness file, see leds.rules file

while : ; do
# Polls xinput query-state for if a key is pressed. "12" corresponds to the keyboard on my system
# this will need to be adjusted for your hardware - see 'xinput list'
keypress=$(xinput query-state 12 | grep down);

if [ -z "$keypress" ]
then
    counter=$(( $counter -1 )) # If keypress is empty then decrement counter.
	
    if [ $counter -lt 0 ]
    then
        # If counter less than 0, turn off keyboard leds
	echo 0 > /sys/class/leds/tpacpi::kbd_backlight/brightness 
	# Set counter to 0 to avoid variable walking off into negative infinity 
	counter=0 
    fi
else
    # If $keypress populated, cat hardware brightness to brightness file. 
    # This path will change based on hardware (asus:: rather than tpacpi:: for instance)
    cat /sys/class/leds/tpacpi::kbd_backlight/brightness_hw_changed  \
    > /sys/class/leds/tpacpi::kbd_backlight/brightness 

    # Change this value to adjust the timeout duration
    counter=25 
fi
# Change this value to adjust polling rate (currently 1/5 second)
sleep 0.2 
done
