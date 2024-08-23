#!/bin/ash
source /mnt/SDCARD/System/usr/trimui/scripts/launchers/common_launcher.sh
cpufreq.sh ondemand 5 7

cd "$STD_DIR/.config/mupen64plus"

export XDG_CONFIG_HOME="$PWD"
export XDG_DATA_HOME="$PWD"
export FRT_NO_EXIT_SHORTCUTS=FRT_NO_EXIT_SHORTCUTS

PATH="$PWD${PATH:+:$PATH}"
export LD_LIBRARY_PATH="$PWD:$PWD/libs${LD_LIBRARY_PATH:+:$LD_LIBRARY_PATH}"

launcher_call=$(grep -i "dowork 0x" "/tmp/log/messages" | tail -n 1)

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

"$PM_DIR"/gptokeyb2 -c "./defkeys.gptk" &
sleep 0.3

HOME="$PWD" ./mupen64plus "$ROM_PATH"

rm -f "$TEMP_ROM"

pkill gptokeyb2
