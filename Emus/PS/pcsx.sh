#!/bin/sh
source /mnt/SDCARD/System/usr/trimui/launchers/init.sh
cpufreq.sh ondemand 3 7

cd $RA_DIR/

HOME=$RA_DIR/ $RA_DIR/ra64.trimui -v -L $RA_DIR/.retroarch/cores/pcsx_rearmed_libretro.so "$@"
source /mnt/SDCARD/System/usr/trimui/launchers/close.sh
