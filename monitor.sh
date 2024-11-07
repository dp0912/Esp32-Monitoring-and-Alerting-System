#!/bin/bash
# Main script to run all monitoring tasks

# Run data collection
bash data_collection.sh

# Run threshold checks
bash threshold_check.sh

# Run log monitoring
bash log_monitor.sh
