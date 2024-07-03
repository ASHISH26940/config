#!/bin/bash

# Function to disconnect all connected Bluetooth devices
disconnect_all_devices() {
    echo "Disconnecting all Bluetooth devices..."
    bluetoothctl << EOF
    devices
    disconnect
    exit
EOF
}

# Function to stop Bluetooth service and related daemons
stop_bluetooth_services() {
    echo "Stopping Bluetooth services..."
    sudo systemctl stop bluetooth
    sudo systemctl stop bluetooth-meshd   # Stop any additional Bluetooth-related services if needed
}

# Main function
main() {
    # Disconnect all Bluetooth devices
    disconnect_all_devices

    # Stop Bluetooth services
    stop_bluetooth_services

    echo "Bluetooth services stopped and all devices disconnected."
}

# Call the main function
main

