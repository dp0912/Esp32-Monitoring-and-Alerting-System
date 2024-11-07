#!/bin/bash
# Script to monitor application logs

LOG_FILE="logs/esp32_monitor.log" # Adjust to your application log
ALERT_LOG="logs/log_monitor_alerts.log"

# Search for errors or warnings
if grep -q -i "error" "$LOG_FILE"; then
    echo "$(date): Error found in logs" >> $ALERT_LOG
    echo "Error detected in logs!" | mail -s "Log Alert" sensordatatest321@gmail.com
fi

if grep -q -i "warning" "$LOG_FILE"; then
    echo "$(date): Warning found in logs" >> $ALERT_LOG
    echo "Warning detected in logs!" | mail -s "Log Alert" sensordatatest321@gmail.com
