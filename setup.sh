#!/bin/bash

read -sp 'Enter password to create iotadmin user:' userpass
echo
useradd -p $(echo $userpass | openssl passwd -1 -stdin) iotadmin
if [ $? -eq 0 ]; then
    echo "User iotadmin added successfully"
else
    echo "Failed to create iotadmin user"
    exit 1
fi

echo "Copying python code to /opt/vmware/people-counter-ingestion-service..."
mkdir -p /opt/vmware/people-counter-ingestion-service
cp image_capture_daemon.py /opt/vmware/people-counter-ingestion-service/