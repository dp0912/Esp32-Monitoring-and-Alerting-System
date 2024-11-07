#!/bin/bash
# Script to collect data from ESP32 sensors

# Define log file location
LOG_FILE="logs/esp32_monitor.log"

# Check if log file exists
if [ ! -f "$LOG_FILE" ]; then
    echo "Log file not found!"
    exit 1
fi

# Read the latest log entry
latest_log=$(tail -n 1 "$LOG_FILE")

# Parse the LDR, sound, and distance values from the log entry
ldr_value=$(echo $latest_log | grep -oP '(?<=LDR:)\d+')
sound_value=$(echo $latest_log | grep -oP '(?<=Sound:)\d+')
distance=$(echo $latest_log | grep -oP '(?<=Distance:)\d+')

# Log the data with a timestamp
echo "$(date): LDR Value: $ldr_value, Sound Value: $sound_value, Distance: $distance" >> "$LOG_FILE"
