#!/bin/sh
source /mnt/SDCARD/System/usr/trimui/launchers/init.sh
cpufreq.sh ondemand 2 6

export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:$PWD

#swapon /mnt/SDCARD/App/swap/swap.img
./OpenBOR "$1"
#swapoff /mnt/SDCARD/App/swap/swap.img
source /mnt/SDCARD/System/usr/trimui/launchers/close.sh
