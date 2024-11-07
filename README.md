# ESP32 Sensor Monitoring System

This project is an alert monitoring system using an ESP32 connected to various sensors to gather environmental data. The ESP32 collects data and sends it to a server for storage and analysis. If any values exceed pre-defined thresholds, email and SMS alerts are triggered.

## Project Overview

The alert monitoring system is designed to:
1. **Collect Data**: The ESP32 gathers data from multiple sensors.
2. **Local Data Storage**: Data is sent to a locally-hosted server for logging.
3. **Database Management**: Store data in a database (InfluxDB or MySQL) for efficient querying and analysis.
4. **Threshold Monitoring**: Bash scripts periodically check sensor data for threshold violations and send alerts if necessary.

---

## Features

- **ESP32 Microcontroller**: Reads data from connected sensors.
- **Data Transfer**: ESP32 sends data to a local server using Bash scripts.
- **Database Integration**: Supports InfluxDB or MySQL for data storage.
- **Threshold-Based Alerts**: Bash script monitors sensor data, sending email and SMS alerts if thresholds are exceeded.

---

## Sensors Used

- **DHT Sensor**: Measures temperature and humidity.
- **Sound Sensor**: Detects sound intensity.
- **Motion Sensor**: Tracks distance and speed.
- **Photoresistor Sensor**: Measures light intensity.

---

## System Architecture

1. **ESP32 Data Collection**: C++ code on the ESP32 gathers data from connected sensors and forwards it to a local server.
2. **Local Server Setup**: A Bash script creates a server environment, which receives data and logs it for database storage.
3. **Database Storage**: Stores data in InfluxDB or MySQL, allowing historical analysis and efficient querying.
4. **Threshold Monitoring and Alerts**: Another Bash script checks stored data periodically. If any sensor data exceeds defined thresholds, an email and SMS alert are sent.

---

## Project Files

- **`esp32_sensor_data.ino`**: C++ code for the ESP32 to read sensor data.
- **`data_collection.sh`**: Script to receive and log data on the local server.
- **`web_server.sh`**: Script to set up a basic local server for data reception.
- **`threshold_check.sh`**: Checks if sensor data values exceed thresholds; sends alerts if necessary.
- **`monitor.sh` and `log_monitor.sh`**: Logs sensor data and server health status.
- **`esp32_monitor.log`**: Log file with recorded sensor data and alert statuses.

---

## Future Development

- **Database Expansion**: Add support for additional database types, e.g., PostgreSQL.
- **Real-time Dashboard**: Develop a dashboard for real-time monitoring of sensor data.
- **Additional Alert Channels**: Support for alerts through other channels, like Slack or webhook integration.
- **Enhanced Threshold Logic**: Add adaptive thresholding based on historical data patterns.

---

## Usage

1. **Setup**: Clone the repository and navigate to the folder.
2. **Install Dependencies**: Ensure your environment has Git, InfluxDB/MySQL, and necessary ESP32 libraries.
3. **Run Scripts**: 
   - Load `esp32_sensor_data.ino` onto the ESP32.
   - Start the local server with `web_server.sh`.
   - Use `data_collection.sh` for data logging.
   - Configure and run `threshold_check.sh` to monitor thresholds.
4. **Check Logs**: View `esp32_monitor.log` for live updates on system status.

---


## Contact

For questions or suggestions, please reach out to [Dhruvin](mailto:your-dhruvinvpatel12@gmail.com).
