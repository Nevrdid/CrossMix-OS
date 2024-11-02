#!/bin/sh
source /mnt/SDCARD/System/usr/trimui/launchers/init.sh
cpufreq.sh ondemand 3 6

export SDL_AUDIODRIVER=dsp
HOME=$PWD ./PPSSPPSDL "$*"
source /mnt/SDCARD/System/usr/trimui/launchers/close.sh
