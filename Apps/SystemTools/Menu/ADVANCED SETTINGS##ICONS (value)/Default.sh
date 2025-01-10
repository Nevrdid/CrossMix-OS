#!/bin/sh
PATH="/mnt/SDCARD/System/bin:$PATH"
LD_LIBRARY_PATH="/mnt/SDCARD/System/lib:/usr/trimui/lib:$LD_LIBRARY_PATH"

/mnt/SDCARD/System/usr/trimui/scripts/infoscreen.sh -m "Applying \"$(basename "$0" .sh)\" icons by default..."

script_name=$(basename "$0" .sh)

find /mnt/SDCARD/Emus/ -name "config.json" -exec sh -c '
    icons_path="/mnt/SDCARD/Icons/$1/Emus/$(basename "$(dirname "{}")").png"
    echo "icons_path $icons_path"
    /mnt/SDCARD/System/bin/jq --arg new_icon "$icons_path" ".icon=\"$icons_path\"" "{}"  > /tmp/tmp_config.json && mv /tmp/tmp_config.json "{}"
' sh "$script_name" {} \;

/mnt/SDCARD/System/usr/trimui/scripts/states_update.sh "ICONS" "$script_name"
