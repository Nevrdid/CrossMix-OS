#!/bin/ash
source /mnt/SDCARD/System/usr/trimui/scripts/launchers/common_launcher.sh
cpufreq ondemand 5 7
ra64.trimui -v $NET_PARAM -L $RA_CORES/opera_libretro.so "$@"
