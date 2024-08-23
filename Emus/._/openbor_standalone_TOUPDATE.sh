#!/bin/ash
source /mnt/SDCARD/System/usr/trimui/scripts/launchers/common_launcher.sh

cpufreq.sh conservative 0 6

cd "$STD_DIR/Openbor/

#echo performance > /sys/devices/system/cpu/cpu0/cpufreq/scaling_governor
#swapon /mnt/SDCARD/App/swap/swap.img
./OpenBOR "$1"
#swapoff /mnt/SDCARD/App/swap/swap.img
