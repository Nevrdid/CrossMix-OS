#!/bin/ash
source /mnt/SDCARD/System/usr/trimui/scripts/launchers/common_launcher.sh
cpufreq.sh ondemand 4 7
ra64.trimui -v $NET_PARAM -L $RA_CORES/mednafen_supafaust_libretro.so "$@"
