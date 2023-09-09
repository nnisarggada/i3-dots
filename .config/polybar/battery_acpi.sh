#!/usr/bin/bash

# Getting the data and initializing an array.
BATTERY_INFO=($(acpi 2>/dev/null | awk -F',' '{ print $0 }'))

# Check if battery information is available
if [ -n "$BATTERY_INFO" ]; then
    # Formatting helpers
    CHARGE=$((${BATTERY_INFO[3]//%,}))
    ICON=""
    FORMAT=""

    # Battery icon to reflect on the bar.
    if [[ "${BATTERY_INFO[2]}" == *"Charging"* ]] || [[ "${BATTERY_INFO[2]}" == *"Unknown"* ]]; then
        ICON="ﮣ"
    else
        ICON=""
    fi

    # Charging status with the same background color
    if [[ $CHARGE -le 20 ]]; then
        FORMAT="%{B#181818}%{B#cc0000}  "
    else
        FORMAT="%{B#181818}%{B#000000}  "
    fi

    # Format charge & color depending on the status.
    FORMAT="$FORMAT $ICON $CHARGE% "

    # Display on the bar
    echo $FORMAT
else
    # No battery information available, so echo an empty string
    echo ""
fi
