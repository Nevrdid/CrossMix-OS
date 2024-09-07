#!/bin/ash
source /mnt/SDCARD/System/usr/trimui/scripts/launchers/common_launcher.sh

cd $STD_DIR/.config/ppsspp_1.17.1
export XDG_CONFIG_HOME=$PWD

launcher_call=$(grep -i "dowork 0x" "/tmp/log/messages" | tail -n 1)

echo "$launcher_call" | grep -q "Perf." && cpufreq.sh interactive 3 8 || cpufreq.sh ondemand 3 6

cd $STD_DIR/.local/share/ppsspp_1.17.1

if echo "$launcher_call" | grep -q "Vulkan"; then
	sed -Ei "s|^(GraphicsBackend =).*|\1 3|" ./ppsspp/PSP/SYSTEM/ppsspp.ini
	HOME="$PWD" PPSSPPSDL_1.17.1_vulkan "$*"
else
	sed -Ei "s|^(GraphicsBackend =).*|\1 0|" ./ppsspp/PSP/SYSTEM/ppsspp.ini
	HOME="$PWD" PPSSPPSDL_1.17.1_gl "$*"
fi
