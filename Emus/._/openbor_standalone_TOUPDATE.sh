#!/bin/ash
source /mnt/SDCARD/System/usr/trimui/scripts/launchers/common_launcher.sh

cpufreq.sh conservative 0 6

cd "$STD_DIR/Openbor/

./OpenBOR "$1"
