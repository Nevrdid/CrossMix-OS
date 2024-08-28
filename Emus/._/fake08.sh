#!/bin/ash
source /mnt/SDCARD/System/usr/trimui/scripts/launchers/common_launcher.sh
cpufreq.sh conservative 0 6

romName=$(basename "$@")
romNameNoExtension=${romName%.*}

if [ "$romNameNoExtension" = "° Run Splore" ]; then
	sh "Pico8 Wrapper - Splore.sh"
	exit
fi

ra64.trimui -v $NET_PARAM -L $RA_CORES/fake08_libretro.so "$@"
