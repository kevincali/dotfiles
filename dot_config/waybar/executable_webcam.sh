#!/usr/bin/env sh
# This script gets the webcam usage status.
# Source: https://github.com/Alexays/Waybar/issues/2705#issuecomment-2253250703

# get programs using the video* endpoint
ps -eo user,pid,cmd -q "$(fuser /dev/video* 2>/dev/null | xargs)" |\

# omit the column headings and wireplumber lines
sed -n "1!p" |\
grep -v "wireplumber" |\

# get the pid and program columns
awk '{print $2 " " $3}' |\

# filter out the program path
awk -F "/" '{print "{\"tooltip\": \"" $1 " " $NF "\"}"}' |\
jq -s 'if length > 0 then {text: "󰄀", tooltip: (map(.tooltip) | join("\r"))} else {text: "", tooltip: ""} end' |\
jq --unbuffered --compact-output
