#!/bin/sh

/mnt/SDCARD/System/usr/trimui/scripts/infoscreen.sh -m "Applying \"$(basename "$0" .sh)\" by default..."

sed -i 's/export NETWORK_SFTPGO="Y"/export NETWORK_SFTPGO="N"/' /mnt/SDCARD/System/etc/ex_config
pkill /mnt/SDCARD/System/sftpgo/sftpgo

# we modify the DB entries to reflect the current state
/mnt/SDCARD/System/usr/trimui/scripts/states_update.sh "SFTPGo" "disabled"
