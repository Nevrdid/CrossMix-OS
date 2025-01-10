#!/bin/sh
PATH="/mnt/SDCARD/System/bin:$PATH"
LD_LIBRARY_PATH="/mnt/SDCARD/System/lib:/usr/trimui/lib:$LD_LIBRARY_PATH"

/mnt/SDCARD/System/usr/trimui/scripts/infoscreen.sh -m "Applying \"$(basename "$0" .sh)\" mode..."

pkill -f "led_config.sh"
output_file="/mnt/SDCARD/System/etc/led_config.sh"
echo -n >"$output_file"

# Menu modification to reflect the change immediately

script_name=$(basename "$0" .sh)

/mnt/SDCARD/System/usr/trimui/scripts/states_update.sh "LEDS" "$script_name"
