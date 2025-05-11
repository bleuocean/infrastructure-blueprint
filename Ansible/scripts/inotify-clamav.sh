#!/bin/bash

WATCH_DIR="/home"
LOG_FILE="/var/log/clamav/inotify-scan.log"

mkdir -p "$(dirname "$LOG_FILE")"

inotifywait -m -r -e create -e moved_to --format '%w%f' "$WATCH_DIR" | while read -r file; do
  echo "$(date): Scanning $file" >> "$LOG_FILE"
  /usr/bin/clamdscan --fdpass --move=/quarantine "$file" >> "$LOG_FILE" 2>&1
done
