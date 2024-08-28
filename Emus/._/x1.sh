#!/bin/ash
source /mnt/SDCARD/System/usr/trimui/scripts/launchers/common_launcher.sh
cpufreq conservative 0 6
ra64.trimui -v $NET_PARAM -L $RA_CORES/x1_libretro.so "$@"
