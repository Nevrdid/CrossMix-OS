#!/bin/ash
source /mnt/SDCARD/System/usr/trimui/scripts/launchers/common_launcher.sh
cpufreq.sh ondemand 0 6

cd "$STD_DIR/Drastic"
export LD_LIBRARY_PATH="${LD_LIBRARY_PATH:+$LD_LIBRARY_PATH:}$PWD/lib"
export LD_PRELOAD="./libSDL2-2.0.so.0.2600.1"

HOME="$PWD" ./drastic "$*"
