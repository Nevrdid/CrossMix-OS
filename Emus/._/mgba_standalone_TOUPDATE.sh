#!/bin/ash
echo $0 $*

source /mnt/SDCARD/System/usr/trimui/scripts/launchers/common_launcher.sh
cpufreq.sh conservative 0 6

cd "$STD_DIR/mgba"

export LD_LIBRARY_PATH="/mnt/SDCARD/System/lib:$PWD/lib:/usr/lib:$LD_LIBRARY_PATH"
export XDG_CONFIG_HOME=/mnt/SDCARD/Standalones

"$PM_DIR"/gptokeyb2 "mgba" -k "mgba" -c "/mnt/SDCARD/Emus/GBA/.config/mgba/mgba.gptk" &
sleep 0.3

mgba "$@" 
kill -9 $(pidof gptokeyb2)
