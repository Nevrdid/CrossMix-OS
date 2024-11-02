#!/bin/sh
source /mnt/SDCARD/System/usr/trimui/launchers/init.sh
cpufreq.sh ondemand 4 7

# cwd is EMU_DIR
cd drastic
export HOME="$PWD"

#export SDL_AUDIODRIVER=dsp
./drastic "$*"
source /mnt/SDCARD/System/usr/trimui/launchers/close.sh
