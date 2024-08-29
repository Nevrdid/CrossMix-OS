#!/bin/ash
source /mnt/SDCARD/System/usr/trimui/scripts/launchers/common_launcher.sh
cpufreq.sh conservative 0 6

# Move the rom to a vertical folder to apply config and remap override

Gamename="$(basename $1)"
TMP_DIR=/mnt/SDCARD/Roms/vertical
mkdir $TMP_DIR
TMP_ROM="$TMP_DIR/$Gamename"
mv $1 $TMP_ROM

ra64.trimui -v $NET_PARAM -L $RA_CORES/fbneo_libretro.so "$TMP_ROM"

mv "$TMP_ROM" $1
rmdir "$TMP_DIR"
