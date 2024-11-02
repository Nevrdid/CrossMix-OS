#!/bin/sh
source /mnt/SDCARD/System/usr/trimui/launchers/init.sh
cpufrq.sh conservative 0 6

cd $RA_DIR/

HOME=$RA_DIR/ $RA_DIR/ra64.trimui -v -L $RA_DIR/.retroarch/cores/genesis_plus_gx_libretro.so "$@"
source /mnt/SDCARD/System/usr/trimui/launchers/close.sh
