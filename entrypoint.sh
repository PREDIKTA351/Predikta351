#!/bin/bash

echo "[*] Starting Xray Core backend..."
/usr/local/bin/xray/xray -config /etc/xray/xray.json &
XRAY_PID=$!

# Hatagi og 2 seconds para mo-initialize ang Xray
sleep 2

# Check kung nagdagan ba ang Xray
if ! kill -0 $XRAY_PID 2>/dev/null; then
    echo "[!] Error: Xray failed to start!"
    exit 1
fi

echo "[*] Xray Core is running successfully (PID: $XRAY_PID)"
echo "[*] Starting Nginx web server on port 8080..."
exec nginx -g 'daemon off;'
