#!/bin/sh
PATH="/mnt/SDCARD/System/bin:$PATH"
LD_LIBRARY_PATH="/mnt/SDCARD/System/lib:/usr/trimui/lib:$LD_LIBRARY_PATH"

/mnt/SDCARD/System/usr/trimui/scripts/infoscreen.sh -m "Applying \"$(basename "$0" .sh)\" by default..."

pkill dropbear
sed -i 's/export NETWORK_SSH="Y"/export NETWORK_SSH="N"/' /mnt/SDCARD/System/etc/ex_config

# we modify the DB entries to reflect the current state
/mnt/SDCARD/System/usr/trimui/scripts/states_update.sh "SSH" "disabled"
