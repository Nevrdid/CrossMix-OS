save_launcher() {
	[ -z "$1" ] && set default

	Launcher_name=$(grep "dowork 0x" "/tmp/log/messages" | tail -n 1 | sed -e 's/.*: \(.*\) dowork 0x.*/\1/')

	if [ ! -f presets.txt ]; then
		echo "$1=$Launcher_name" >presets.txt
	elif grep -q "^$1=" presets.txt &>/dev/null; then
		sed -i "s/^$1=.*/$1=$Launcher_name/" presets.txt
	elif [ "$1" = default ]; then
		sed -i "1idefault=$Launcher_name" presets.txt
	else
		echo "$1=$Launcher_name" >>presets.txt
	fi
}

# extract the path up to the first Emus subfolder from $0
EMU_DIR="$(echo "$0" | sed -E 's|(.*Emus/[^/]+)/.*|\1|')"
PM_DIR="/mnt/SDCARD/Apps/PortMaster/PortMaster"
GAME=$(basename "$1")

export PATH="/mnt/SDCARD/System/usr/trimui/scripts/:/mnt/SDCARD/System/bin:$PM_DIR:${PATH:+:$PATH}"
export LD_LIBRARY_PATH="/usr/trimui/lib:/mnt/SDCARD/System/lib${LD_LIBRARY_PATH:+:$LD_LIBRARY_PATH}"

dir=/mnt/SDCARD/System/usr/trimui/scripts/launchers

if grep -q ra64.trimui "$0"; then
	RA_DIR="/mnt/SDCARD/RetroArch"
	RA_CORES="$RA_DIR/.retroarch/cores"
	export PATH="$PATH:$RA_DIR"
	export HOME="$RA_DIR"

	source $dir/FolderOverrideFinder.sh

	ra_audio_switcher.sh
else
	STD_DIR="/mnt/SDCARD/Standalones"
	export PATH="$PATH:$STD_DIR/bin"
	export LD_LIBRARY_PATH="$LD_LIBRARY_PATH:$STD_DIR/lib"

fi

cd "$EMU_DIR"

# Save launcher as default for the game
button_state.sh L
[ $? -eq 10 ] && save_launcher "$GAME"

# Save launcher as default one
button_state.sh R
[ $? -eq 10 ] && save_launcher

[ -n "$RA_DIR" ] && cd "$RA_DIR"
