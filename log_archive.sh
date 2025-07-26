#!/bin/bash

if [ -z "$1" ]; then
  echo "Usage: $0 <log-directory>"
  exit 1
fi

LOG_DIR=$1

if [ ! -d "$LOG_DIR" ]; then
  echo "Error: Directory '$LOG_DIR' does not exist."
  exit 1
fi

ARCHIVE_DIR="./log-archives"
mkdir -p "$ARCHIVE_DIR"

TIMESTAMP=$(date +"%Y%m%d_%H%M%S")
ARCHIVE_FILE="logs_archive_${TIMESTAMP}.tar.gz"

tar -czf "$ARCHIVE_DIR/$ARCHIVE_FILE" -C "$LOG_DIR" .

if [ $? -eq 0 ]; then
  echo "Archive created: $ARCHIVE_DIR/$ARCHIVE_FILE"
  echo "[$(date)] Archived $LOG_DIR to $ARCHIVE_DIR/$ARCHIVE_FILE" >> archive.log
else
  echo "Failed to create archive."
  exit 1
fi

