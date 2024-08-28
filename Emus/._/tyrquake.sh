#!/bin/ash
source /mnt/SDCARD/System/usr/trimui/scripts/launchers/common_launcher.sh
cpufreq.sh conservative 0 6
ra64.trimui -v $NET_PARAM -L $RA_CORES/tyrquake_libretro.so "$@"
