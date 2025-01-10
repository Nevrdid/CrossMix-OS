for i in /mnt/SDCARD/Themes/**/config.json; do
    if [ ! -f "$i".bck ]; then
      cp "$i" "$i".bck
    fi
    sed -i 's/"content_font1":[0-9]*/"content_font1":36/' "$i"
done

/mnt/SDCARD/System/usr/trimui/scripts/states_update.sh --mainui "TITLES FONTSIZE" "36"
