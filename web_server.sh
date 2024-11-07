#!/bin/bash

# Set the port and log file
PORT=7000
LOG_FILE="logs/esp32_monitor.log"

# Create log directory if it doesn't exist
mkdir -p logs

# Start listening on the specified port
echo "Starting server on port $PORT..."
while true; do
    # Use nc to listen on the port and handle incoming requests
    {
        # Read the request line
        read request_line
        # Read headers (this will keep reading until an empty line)
        while read header && [ "$header" != $'\r' ]; do
            : # Ignore headers
        done

        # Read POST data
        read -d '' post_data

        # Log the incoming data
        echo "$(date): $post_data" >> "$LOG_FILE"

        # Respond to the request
        echo -ne "HTTP/1.1 200 OK\r\nContent-Length: 0\r\n\r\n"
    } | nc -l -p "$PORT" -k
done
