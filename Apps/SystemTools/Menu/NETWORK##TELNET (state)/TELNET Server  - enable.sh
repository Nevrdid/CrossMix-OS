#!/bin/sh
PATH="/mnt/SDCARD/System/bin:$PATH"
export LD_LIBRARY_PATH="/mnt/SDCARD/System/lib:/usr/trimui/lib:$LD_LIBRARY_PATH"

/mnt/SDCARD/System/usr/trimui/scripts/infoscreen.sh -m "Applying \"$(basename "$0" .sh)\" by default..."

pkill telnetd
telnetd

# we modify the DB entries to reflect the current state
/mnt/SDCARD/System/usr/trimui/scripts/states_update.sh "TELNET" "enabled"

sleep 1
IP=$(ip route get 1 2>/dev/null | awk '{print $NF;exit}')
echo "TELNET server IP: $IP"

/mnt/SDCARD/System/usr/trimui/scripts/infoscreen.sh -m "TELNET server IP: $IP" -t 4
