#!/bin/ash
source /mnt/SDCARD/System/usr/trimui/scripts/launchers/common_launcher.sh
cpufreq.sh conservative 0 6
export XDG_CONFIG_HOME=$STD_DIR/.config
OpenBOR "$1"
