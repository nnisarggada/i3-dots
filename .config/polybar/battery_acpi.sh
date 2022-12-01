## battery_detect_acpi.sh 

#!/usr/bin/bash


# Getting the data and initializing an array.
BATTERY_INFO=($( acpi | awk -F',' '{ print $0 }'))

# Formatting helpers
CHARGE=$((${BATTERY_INFO[3]//%,}))
ICON=""
FORMAT=""

# Battery icon to reflect on the bar.
if [[ "${BATTERY_INFO[2]}" == *"Charging"* ]] || [[ "${BATTERY_INFO[2]}" == *"Unknown"* ]] ; then
    ICON="ﮣ"
else
    ICON=""
fi


# charging status with same background color
if [[ $CHARGE -lt 20 ]]; then
    FORMAT="%{B#181818}%{B#cccc0000}  "
elif [[ $CHARGE -lt 30 ]]; then
    FORMAT="%{B#181818}%{B#cc000000}  "
elif [[ $CHARGE -lt 60 ]]; then
    FORMAT="%{B#181818}%{B#cc000000}  "
elif [[ $CHARGE -lt 100 ]]; then
    FORMAT="%{B#181818}%{B#cc000000}  "
fi

# Format charge & color depending on the status.
FORMAT="$FORMAT $ICON $CHARGE% "

# Display on bar
echo $FORMAT
