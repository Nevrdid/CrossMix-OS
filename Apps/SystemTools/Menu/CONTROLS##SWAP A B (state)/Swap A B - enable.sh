#!/bin/sh

/mnt/SDCARD/System/usr/trimui/scripts/infoscreen.sh -m "Applying \"$(basename "$0" .sh)\" by default..."

touch /var/trimui_inputd/swap_ab

/mnt/SDCARD/System/usr/trimui/scripts/states_update.sh "SWAP A B" "enabled"
