#!/bin/bash

# MAC address of your Bluetooth device (boAt Rockerz 255 Pro+)
DEVICE_MAC="4C:72:74:FD:BD:7F"

# Function to stop Bluetooth service and related daemons
stop_bluetooth_services() {
    echo "Stopping Bluetooth services..."
    sudo systemctl stop bluetooth
    sudo systemctl stop bluetooth-meshd   # Stop any additional Bluetooth-related services if needed
}

# Function to start Bluetooth service
start_bluetooth_service() {
    echo "Starting Bluetooth service..."
    sudo systemctl start bluetooth
    sleep 2  # Wait for Bluetooth service to start
}

# Function to check if Bluetooth is powered on
check_bluetooth_status() {
    bluetoothctl show | grep -q "Powered: yes"
    return $?
}

# Function to connect to the specified Bluetooth device
connect_device() {
    local device_mac="$1"
    
    echo "Connecting to device with MAC address: $device_mac"
    bluetoothctl connect "$device_mac"
}

# Main function
main() {
    # Stop Bluetooth services
    stop_bluetooth_services

    # Start Bluetooth service
    start_bluetooth_service

    # Check if Bluetooth is powered on
    if ! check_bluetooth_status; then
        echo "Bluetooth failed to start. Exiting."
        exit 1
    fi

    # Connect to the device
    connect_device "$DEVICE_MAC"

    echo "Bluetooth device connection process complete."
}

# Call the main function
main

