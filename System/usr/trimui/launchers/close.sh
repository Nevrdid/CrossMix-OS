end=$(date %s)
duration=$(($end - $start))

oldtime=$(grep "$1" /mnt/SDCARD/.spendtimes)
if [ -z "$oldtime" ]; then
    echo "$1=$duration" >>/mnt/SDCARD/.spendtimes
else
    oldtime=$(echo "$oldtime" | cut -d= -f2)
    newtime=$(("$oldtime + $duration"))
    sed -i "s/$1.*/$1=$newtime/" /mnt/SDCARD/.spendtimes
fi
