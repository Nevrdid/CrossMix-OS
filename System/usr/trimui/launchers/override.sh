# Subdirs example : MAME/0/1943.zip
subdirs=${1##*/Roms/}
# System=MAME
System=${subdirs%%/*}
RA_confdir=/mnt/SDCARD/RetroArch/.retroarch/config


# "//" != "/"
if [ ! "$(echo "$subdirs" | tr -dc '/')" = "/" ] ; then
	echo "############### Folder Overrride Finder ###############"
	echo "Subdirectory from $System detected !"

  # We find the core filename in the launch script itself
	core_filename=$(grep 'ra.trimui' "$0" | sed -E 's|.*cores/([^/]+\.so).*|\1|')
  # We use a core database which indicates for a core filename the corresponding config path
	core_folder=$(grep -m 1 "$core_filename" /mnt/SDCARD/System/usr/trimui/res/core_folders.csv | cut -d';' -f2)
	echo "The core folder for $core_filename is: $core_folder"

	result="$RA_confdir/$core_folder/$System.cfg"
	if [ ! -f "$result" ]; then
		# we try to find the folder override without the core database
		result=$(find $RA_confdir -name "$System.cfg")
		num_lines=$(echo "$result" | wc -l)

		if [ "$num_lines" -gt 1 ]; then
			# if we find multiple folder override config files, we try to find the right one depending the core name
			core_name=${core_filename%_libretro.so}
			result=$(echo "$result" | grep -i "$core_name/")
			num_lines=$(echo "$result" | wc -l)
			if [ "$num_lines" -gt 1 ]; then
				echo "Multiple possibilities found, none selected"
				result=""
			fi
		fi
	fi
	if [ -n "$result" ]; then
		echo "Folder override found: $result"
		echo "#######################################################"
		set -- "$@" --appendconfig "$result"
	else
		echo "Folder override not found"
		echo "#######################################################"
	fi
fi
