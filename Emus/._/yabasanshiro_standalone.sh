#!/bin/ash
source /mnt/SDCARD/System/usr/trimui/scripts/launchers/common_launcher.sh
cpufreq.sh ondemand 5 7

export HOME="$STD_DIR/.config"
export XDG_DATA_HOME="$STD_DIR/.local/share"
cd $XDG_DATA_HOME/yabasanshiro

if grep -i "dowork 0x" "/tmp/log/messages" | tail -n 1 | grep -iq "(HLE BIOS)"; then
  BIOS_FILE=""
  echo "Using Yabasanshiro HLE BIOS"
elif echo $Launch_name | grep -iq "(GameNavi BIOS)"; then
  BIOS_FILE="/mnt/SDCARD/BIOS/GameNavi HiSaturn v1.03 (JAP-RF).bin"
else
  BIOS_FILE="/mnt/SDCARD/BIOS/saturn_bios.bin"
fi

if [ ! -f "$BIOS_FILE" ]; then
  BIOS_FILE=""
  echo "BIOS file not found, falling back to HLE BIOS"
else
  echo "Using real Saturn BIOS"
fi

gptokeyb "yabasanshiro" -c "keys.gptk" -k yabasanshiro &
yabasanshiro -r 3 -i "$@" -b "$BIOS_FILE" &>out.log
pkill gptokeyb
