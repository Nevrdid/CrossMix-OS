#!/bin/ash
source /mnt/SDCARD/System/usr/trimui/scripts/launchers/common_launcher.sh
cpufreq.sh ondemand 7 7
ra64.trimui -v $NET_PARAM -L $RA_CORES/yabasanshiro_libretro.so "$@"
