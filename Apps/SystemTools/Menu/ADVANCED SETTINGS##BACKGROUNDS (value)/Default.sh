#!/bin/sh
PATH="/mnt/SDCARD/System/bin:$PATH"
LD_LIBRARY_PATH="/mnt/SDCARD/System/lib:/usr/trimui/lib:$LD_LIBRARY_PATH"

/mnt/SDCARD/System/usr/trimui/scripts/infoscreen.sh -m "Applying \"$(basename "$0" .sh)\" backgrounds by default..."

script_name=$(basename "$0" .sh)

find /mnt/SDCARD/Emus/ -name "config.json" -exec sh -c '
    bg_path="/mnt/SDCARD/Backgrounds/$1/$(basename "$(dirname "{}")").png"
    echo "bg_path $bg_path"
    /mnt/SDCARD/System/bin/jq --arg new_icon "$bg_path" ".background=\"$bg_path\"" "{}"  > /tmp/tmp_config.json && mv /tmp/tmp_config.json "{}"
' sh "$script_name" {} \;

/mnt/SDCARD/System/usr/trimui/scripts/states_update.sh "BACKGROUNDS" "$script_name"
