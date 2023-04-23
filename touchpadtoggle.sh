#!/bin/sh
#
# A tiny script that toggles the touchpad.
# Bind it to run with a key combo in oyur favourite WM or DE. I find alt+space convenient.
# Very handy on one of my laptops that activates the touchpad when picked up, because it is so very bendy and cheap.

# Use xinput list and do a search for touchpads. Then get the first one and get its name.
device="$(xinput list | grep -P '(?<= )[\w\s:]*(?i)(touchpad|synaptics)(?-i).*?(?=\s*id)' -o | head -n1)"

# Toggle it!
[[ "$(xinput list-props "$device" | grep -P ".*Device Enabled.*\K.(?=$)" -o)" == "1" ]] &&
    xinput disable "$device" ||
    xinput enable "$device"
