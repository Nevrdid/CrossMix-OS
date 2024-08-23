#!/bin/sh
echo "===================================="
echo $0 $*
source /mnt/SDCARD/System/usr/trimui/scripts/common_launcher.sh
cpufreq.sh conservative 0 6
RA_DIR=/mnt/SDCARD/RetroArch
EMU_DIR=/mnt/SDCARD/Emus/MD
cd $RA_DIR/


HOME=$RA_DIR/ $RA_DIR/ra64.trimui -v $NET_PARAM -L $RA_DIR/.retroarch/cores/genesis_plus_gx_libretro.so "$@"
