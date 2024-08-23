#!/bin/ash
source /mnt/SDCARD/System/usr/trimui/scripts/launchers/common_launcher.sh
cpufreq.sh conservative 0 6

cd "$RA_DIR"

case "$@" in
    *.neo) CORE_PATH=.retroarch/cores/geolith_libretro.so ;; # fall back to geolith for terraonion .neo
    *)     
        if grep -i "dowork 0x" "/tmp/log/messages" | tail -n 1 | grep -qi "FB Alpha 2012"; then # fb alpha 2012 selected
            CORE_PATH=.retroarch/cores/fbalpha2012_neogeo_libretro.so
        else
            CORE_PATH=.retroarch/cores/fbneo_libretro.so
        fi
        ;;
esac

HOME="$PWD" ./ra64.trimui -v $NET_PARAM -L "$CORE_PATH" "$@"

