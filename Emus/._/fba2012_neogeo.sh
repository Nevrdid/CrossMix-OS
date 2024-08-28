#!/bin/ash
source /mnt/SDCARD/System/usr/trimui/scripts/launchers/common_launcher.sh
cpufreq.sh ondemand 1 6
ra64.trimui -v $NET_PARAM -L $RA_CORES/fbalpha2012_neogeo_libretro.so "$@"
