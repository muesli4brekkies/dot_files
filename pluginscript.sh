# Checks if .../AC0/online has changed in the last second. If yes, plays sound and sends notification.

# Set as executable and schedule or autostart by your preferred method. You could even run it yourself if you feel inclined.

#!/bin/sh
Storage=0
while [ 1 ]
do
if [ $(cat /sys/class/power_supply/AC0/online) -gt $Storage ]; then	
	paplay /usr/share/sounds/plugin.ogg 
	dunstify "Charging!" -t 2000
	Storage=1
elif [ $(cat /sys/class/power_supply/AC0/online) -lt $Storage ]; then
	paplay /usr/share/sounds/plugout.ogg
	dunstify "NOT Charging!" -t 2000 
	Storage=0
else
sleep 1
fi
done
