#!/bin/sh

PATH="/mnt/SDCARD/System/bin:$PATH"
export LD_LIBRARY_PATH="/mnt/SDCARD/System/lib:/mnt/SDCARD/System/lib/samba:/usr/trimui/lib:$LD_LIBRARY_PATH"

/mnt/SDCARD/System/usr/trimui/scripts/infoscreen.sh -m "Applying \"$(basename "$0" .sh)\" by default..."

kill -9 $(pidof wsddn)
kill -9 $(pidof smbd)
kill -9 $(pidof nmbd)

rm -rf /var/cache/samba /var/log/samba /var/lock/subsys /var/run/samba /var/lib/samba/

# we modify the DB entries to reflect the current state
/mnt/SDCARD/System/usr/trimui/scripts/states_update.sh "SMB" "disabled"
