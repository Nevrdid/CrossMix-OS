#!/bin/ash
source /mnt/SDCARD/System/usr/trimui/scripts/launchers/common_launcher.sh
cpufreq.sh ondemand 3 6


cd $STD_DIR/.local/share/ppsspp_1.17.1
export SDL_AUDIODRIVER=dsp
HOME="$PWD" ./PPSSPPSDL_1.17.1_gl "$*"
