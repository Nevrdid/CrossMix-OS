#!/bin/ash
source /mnt/SDCARD/System/usr/trimui/scripts/launchers/common_launcher.sh
cpufreq.sh ondemand 1 6

cd $STD_DIR/.local/share/drastic

LAUNCHER=$(grep -i "dowork 0x" "/tmp/log/messages" | tail -n 1)

if ! echo "$LAUNCHER" | grep -iq "No Overlay"; then
  export LD_PRELOAD="$STD_DIR/lib/libSDL2-2.0.so.0.2600.1"
fi

export HOME="$PWD"

if echo "$LAUNCHER" | grep -iq "Nearest"; then
  echo "Using nearest neighbour scaling"
  drastic_nn "$@"
else
  echo "Using bilinear scaling"
  drastic "$@"
fi
