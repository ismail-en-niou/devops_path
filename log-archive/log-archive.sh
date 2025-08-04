#!/bin/bash

# Log Archive Tool
# Usage: ./log-archive.sh <log-directory>
# Archives logs from the given directory into a timestamped tar.gz file in archived_logs directory
# Logs the operation with date/time to archive_log.txt

set -e

if [ $# -ne 1 ]; then
    echo "Usage: $0 <log-directory>"
    exit 1
fi

LOG_DIR="$1"
ARCHIVE_DIR="archived_logs"
LOG_FILE="archive_log.txt"
TIMESTAMP=$(date +"%Y%m%d_%H%M%S")
ARCHIVE_NAME="logs_archive_${TIMESTAMP}.tar.gz"
ARCHIVE_PATH="${ARCHIVE_DIR}/${ARCHIVE_NAME}"

if [ ! -d "$LOG_DIR" ]; then
    echo "Error: Log directory '$LOG_DIR' does not exist."
    exit 1
fi

mkdir -p "$ARCHIVE_DIR"

tar -czf "$ARCHIVE_PATH" -C "$(dirname "$LOG_DIR")" "$(basename "$LOG_DIR")"

echo "${TIMESTAMP}: Archived '${LOG_DIR}' to '${ARCHIVE_PATH}'" >> "$LOG_FILE"

echo "Archived '${LOG_DIR}' to '${ARCHIVE_PATH}'"
echo "Logged archive operation to '${LOG_FILE}'"