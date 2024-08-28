#!/bin/ash
source /mnt/SDCARD/System/usr/trimui/scripts/launchers/common_launcher.sh
cpufreq.sh ondemand 5 7
ra64.trimui -v $NET_PARAM -L $RA_CORES/parallel_n64_libretro.so "$@"
