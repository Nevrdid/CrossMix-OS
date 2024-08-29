# extract the path up to the first Emus subfolder from $0
EMU_DIR="$(echo "$0" | sed 's|\(.*Emus/[^/]*\)/.*|\1|')"
PM_DIR="/mnt/SDCARD/Apps/PortMaster/PortMaster"

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
source $dir/save_launcher.sh

[ -n "$RA_DIR" ] && cd $RA_DIR
