#!/bin/ash
source /mnt/SDCARD/System/usr/trimui/scripts/launchers/common_launcher.sh
cpufreq.sh ondemand 1 6

progdir=$(dirname "$0")
romdir=$(dirname "$1")
romname=$(basename "$1")
romNameNoExtension=${romname%.*}

# What ? and why ?
HOME=$RA_DIR/ $RA_DIR/ra64.trimui -v $NET_PARAM -L $RA_DIR/$RA_CORES/km_daphne_xtreme_libretro.so "$romdir/${romNameNoExtension}.zip" "${@:2}"
