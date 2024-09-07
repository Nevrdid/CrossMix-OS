#!/bin/ash

source /mnt/SDCARD/System/usr/trimui/scripts/launchers/common_launcher.sh

cd $STD_DIR/.config/ppsspp_1.15.4
export XDG_CONFIG_HOME=$PWD

launcher_call=$(grep -i "dowork 0x" "/tmp/log/messages" | tail -n 1)
echo $launcher_call | grep -qi "Perf." && cpufreq.sh ondemand 3 8 || cpufreq.sh ondemand 3 6

cd $STD_DIR/.local/share/ppsspp_1.15.4

PPSSPPSDL_1.15.4 "$*"
