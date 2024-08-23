#!/bin/ash
source /mnt/SDCARD/System/usr/trimui/scripts/launchers/common_launcher.sh
cpufreq.sh ondemand 0 6

cd "$STD_DIR/Drastic"

HOME="$PWD" ./drastic "$*"
