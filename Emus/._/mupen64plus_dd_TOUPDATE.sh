#!/bin/ash

source /mnt/SDCARD/System/usr/trimui/scripts/launchers/common_launcher.sh
cpufreq.sh ondemand 5 7

export XDG_CONFIG_HOME="$STD_DIR/.config"
export XDG_DATA_HOME="$STD_DIR/.local/share"
export FRT_NO_EXIT_SHORTCUTS=FRT_NO_EXIT_SHORTCUTS

case "$*" in
*.n64 | *.v64 | *.z64 | *.ndd)
	ROM_PATH="$*"
	;;
*.zip | *.7z)
	TEMP_ROM=$(mktemp)
	ROM_PATH="$TEMP_ROM"
	7zz e "$*" -so >"$TEMP_ROM"
	;;
esac

$PM_DIR/gptokeyb -1 mupen64plus -c "./defkeys.gptk" &

mupen64plus "$ROM_PATH" 2>&1

rm -f "$TEMP_ROM"

pkill gptokeyb
