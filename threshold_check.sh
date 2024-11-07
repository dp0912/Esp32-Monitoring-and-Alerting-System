#!/bin/bash
# Script to check sensor data against thresholds

# Define thresholds
LDR_THRESHOLD=500  # Adjust according to your requirements
SOUND_THRESHOLD=300  # Adjust according to your requirements
DISTANCE_THRESHOLD=30  # Adjust according to your requirements

# Read the latest log entry
latest_log=$(tail -n 1 logs/esp32_monitor.log)
ldr_value=$(echo $latest_log | grep -oP '(?<=LDR Value: )\d+')
sound_value=$(echo $latest_log | grep -oP '(?<=Sound Value: )\d+')
distance=$(echo $latest_log | grep -oP '(?<=Distance: )\d+')

# Function to send alerts
send_alert() {
    message="$1"
    echo "$message" | mail -s "Sensor Alert" sensordatatest321@gmail.com
}

# Check thresholds
if (( ldr_value > LDR_THRESHOLD )); then
    send_alert "High LDR value detected: $ldr_value"
fi

if (( sound_value > SOUND_THRESHOLD )); then
    send_alert "High sound level detected: $sound_value"
fi

if (( distance < DISTANCE_THRESHOLD )); then
    send_alert "Object too close detected: $distance"
fi
