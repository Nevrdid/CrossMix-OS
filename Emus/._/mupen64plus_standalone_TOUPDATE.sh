#!/bin/ash
source /mnt/SDCARD/System/usr/trimui/scripts/launchers/common_launcher.sh
cpufreq.sh ondemand 5 7

export XDG_CONFIG_HOME="$STD_DIR/.config"
export XDG_DATA_HOME="$STD_DIR/.local/.share"
export FRT_NO_EXIT_SHORTCUTS=FRT_NO_EXIT_SHORTCUTS

launcher_call=$(grep -i "dowork 0x" "/tmp/log/messages" | tail -n 1)

cd $XDG_CONFIG_HOME
if echo $launcher_call | grep -qi "Rice"; then
	set_ra_cfg.sh "$PWD/mupen64plus.cfg" "VideoPlugin" "mupen64plus-video-rice.so"
else
	set_ra_cfg.sh "$PWD/mupen64plus.cfg" "VideoPlugin" "mupen64plus-video-glide64mk2.so"
	echo $launcher_call | grep -qi "16:9"
	set_ra_cfg.sh "$PWD/mupen64plus.cfg" "aspect" $((!$?))
fi

case "$*" in
*.n64 | *.v64 | *.z64)
	ROM_PATH="$*"
	;;
*.zip | *.7z)
	TEMP_ROM=$(mktemp)
	ROM_PATH="$TEMP_ROM"
	7zz e "$*" -so >"$TEMP_ROM"
	;;
esac

$PM_DIR/gptokeyb2 -c "./defkeys.gptk" &
sleep 0.3

mupen64plus "$ROM_PATH"

rm -f "$TEMP_ROM"

pkill gptokeyb2
