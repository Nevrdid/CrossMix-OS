for i in /mnt/SDCARD/Themes/**/config.json.bck; do
  mv "$i" "$(dirname "$i")/$(basename "$i" .bck)"
done

/mnt/SDCARD/System/usr/trimui/scripts/states_update.sh --mainui "TITLES FONTSIZE" "default"
