#!/bin/ash
source /mnt/SDCARD/System/usr/trimui/scripts/launchers/common_launcher.sh

set_backend() {
	sed -i "s|^(GraphicsBackend = ).*|\1$1|" ppsspp/PSP/SYSTEM/ppsspp.ini
	return 0
}

cd $STD_DIR/.config/ppsspp_1.17.1
export XDG_CONFIG_HOME=$PWD

launcher_call=$(grep -i "dowork 0x" "/tmp/log/messages" | tail -n 1)
echo $launcher_call | grep -qi "Perf." && cpufreq.sh ondemand 3 8 || cpufreq.sh ondemand 3 6
echo $launcher_call | grep -qi "Vulkan" && set_backend 3 && back=vulkan || set_backend 0 && back=gl

cd $STD_DIR/.local/share/ppsspp_1.17.1

HOME="$PWD" PPSSPPSDL_1.17.1_$back "$*"
