#!/bin/ash
source /mnt/SDCARD/System/usr/trimui/scripts/launchers/common_launcher.sh
cpufreq.sh conservative 0 6

set_ra_cfg.sh \
	"$RA_DIR/.retroarch/config/Genesis Plus GX Wide/MD.cfg" \
	"input_overlay_enable" "false"

ra64.trimui -v $NET_PARAM -L $RA_CORES/genesis_plus_gx_wide_libretro.so "$@"
