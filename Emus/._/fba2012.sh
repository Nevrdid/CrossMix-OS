#!/bin/ash
source /mnt/SDCARD/System/usr/trimui/scripts/launchers/common_launcher.sh
cpufreq.sh conservative 0 6

cd "$RA_DIR"

HOME="$RA_DIR" ./ra64.trimui -v $NET_PARAM -L .retroarch/cores/fbalpha2012_libretro.so "$@"

