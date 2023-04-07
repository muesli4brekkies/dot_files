#!/bin/sh
/bin/systemctl restart python3-validity.service && /usr/lib/open-fprintd/resume.py
# python3-validity and open-fprintd-resume don't play nice at the mo. This little script fixes it.
# You may need a sleep between the commands depending on how quickly python3-validity restarts on your system
# Works on :Thinkpad x270 with 138a:0097 Validity fingerprint sensor
