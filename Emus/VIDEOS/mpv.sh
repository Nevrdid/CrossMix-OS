#!/bin/ash
extension="${@##*.}"

if [ "$extension" = "launch" ]; then
	sh "$1"
	exit
fi

source /mnt/SDCARD/System/usr/trimui/scripts/launchers/common_launcher.sh
cpufreq.sh conservative 0 6

"$PM_DIR"/gptokeyb2 -1 "mpv" -c "keys.gptk" &
sleep 0.4

echo 1 > /tmp/stay_awake
HOME="$PWD" mpv "$@" --fullscreen --audio-buffer=1 --terminal=no # --lavfi-complex="[aid1]asplit[ao][a]; [a]showcqt[vo]" --script=/mnt/SDCARD/Emus/VIDEOS/.config/mpv/metadata_osd.lua  #--autofit=100%x1280    # for music: --geometry=720   # visu: --lavfi-complex="[aid1]asplit[ao][a]; [a]showcqt[vo]"
rm /tmp/stay_awake

pkill -9 gptokeyb2
