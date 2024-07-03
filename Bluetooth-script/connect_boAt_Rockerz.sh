#!/bin/bash

# MAC address of your Bluetooth device (boAt Rockerz 255 Pro+)
DEVICE_MAC="4C:72:74:FD:BD:7F"

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
    # Check if Bluetooth is powered on
    if ! check_bluetooth_status; then
        echo "Bluetooth is not powered on. Turning it on..."
        sudo systemctl start bluetooth
        sleep 2  # Wait for Bluetooth service to start
        if ! check_bluetooth_status; then
            echo "Failed to start Bluetooth. Exiting."
            exit 1
        fi
    fi

    # Connect to the device
    connect_device "$DEVICE_MAC"

    echo "Bluetooth device connection process complete."
}

# Call the main function
main

