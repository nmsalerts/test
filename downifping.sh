#!/bin/bash

# Configuration
DEVICE_IP="10.23.4.41"  # Replace with the target IP address
EMAIL_TO="ajithraj@iittp.ac.in"  # Replace with the recipient's email address
EMAIL_SUBJECT="Device Down Alert"
EMAIL_BODY="The device with IP $DEVICE_IP is not responding to ping requests."

# Ping the device (adjust count if necessary)
ping -c 3 $DEVICE_IP > /dev/null 2>&1

# Check the result
if [ $? -ne 0 ]; then
    # If the device is down, send an email
    echo "$EMAIL_BODY" | mail -s "$EMAIL_SUBJECT" "$EMAIL_TO"
    echo "Alert sent to $EMAIL_TO about device $DEVICE_IP being down."
else
    echo "Device $DEVICE_IP is up."
fi
