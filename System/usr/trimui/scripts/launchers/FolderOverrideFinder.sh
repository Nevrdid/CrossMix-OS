subdir_count=$(echo "$1" | awk -F'/Roms/' '{print $2}' | awk -F'/' '{print NF-1}') # Count the number of slashes in the rest of the path

if [ "$subdir_count" -gt 1 ]; then
	if [ -z "$2" ]; then # the override config file is not already defined
		echo "############### Folder Overrride Finder ###############"
		first_subdir=$(echo "$1" | sed -E 's|.*/Roms/([^/]+).*|\1|') # Use sed to extract the part of the path after "/mnt/SDCARD/Roms/" to the next "/".
		echo "Subdirectory from $first_subdir detected !"

		# We try to find the config folder :
		core_filename=$(grep "ra64.trimui" "$0" | sed -E 's|.*RA_CORES/([^/]+\.so).*|\1|')                               # we find the core filename in the launch script itself
		core_folder=$(grep -m 1 "$core_filename" /mnt/SDCARD/System/usr/trimui/scripts/core_folders.csv | cut -d';' -f2) # we use a core database which indicates for a core filename the corresponding config path
		echo "The core folder for $core_filename is: $core_folder"

		FolderOverride="$RA_DIR/.retroarch/config/$core_folder/$first_subdir.cfg"

		if [ ! -f "$FolderOverride" ]; then
			# we try to find the folder override without the core database
			FolderOverride=$(find "$RA_DIR/.retroarch/config/" -name "$first_subdir.cfg")
			num_lines=$(echo "$FolderOverride" | wc -l)
			if [ "$num_lines" -gt 1 ]; then
				# if we find multiple folder override config files, we try to find the right one depending the core name
				core_name=$(echo "$core_filename" | cut -d'_' -f1)
				FolderOverride=$(echo "$FolderOverride" | grep -i "$core_name/")
				num_lines=$(echo "$FolderOverride" | wc -l)
				if [ "$num_lines" -gt 1 ]; then
					# less restrictive comparison  :
					FolderOverride=$(echo "$FolderOverride" | grep -i "$core_name")
					num_lines=$(echo "$FolderOverride" | wc -l)
					if [ "$num_lines" -gt 1 ]; then
						echo "Multiple possibilities found, none selected"
						FolderOverride=""
					fi

				fi
			fi
		fi

		if [ ! -z "$FolderOverride" ]; then

			echo "Folder override found: $FolderOverride"
			echo "#######################################################"
			source "$0" "$1" --appendconfig "$FolderOverride"
			exit
		else
			echo "Folder override not found"
			echo "#######################################################"
		fi
	fi
else
	echo "No subdirectory detected."
fi
