#!/bin/bash

# PocketBase startup script with auto-configuration
echo "Starting PocketBase with auto-configuration..."

# Create data directory if it doesn't exist
mkdir -p /app/pb_data

# Start PocketBase
./pocketbase serve --http 0.0.0.0:8080 --dir /app/pb_data
