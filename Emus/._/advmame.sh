#!/bin/sh
source /mnt/SDCARD/System/usr/trimui/scripts/launchers/common_launcher.sh
cpufreq.sh conservative 0 6
export HOME=$STD_DIR/.config
cd $HOME
Gamefile=$(basename "$@")
Gamedir=$(dirname "$@")
advmame -dir_rom "$Gamedir" "${Gamefile%.*}"
