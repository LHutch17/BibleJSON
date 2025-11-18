#!/bin/bash
# Script to create a downloadable archive of all Bible JSON files

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
OUTPUT_DIR="${1:-$SCRIPT_DIR}"
ARCHIVE_NAME="bible-json-$(date +%Y%m%d).tar.gz"

echo "Creating archive of Bible JSON files..."
echo "Output: $OUTPUT_DIR/$ARCHIVE_NAME"

cd "$SCRIPT_DIR"
tar -czf "$OUTPUT_DIR/$ARCHIVE_NAME" JSON/

if [ $? -eq 0 ]; then
    echo "Archive created successfully!"
    echo "Size: $(du -h "$OUTPUT_DIR/$ARCHIVE_NAME" | cut -f1)"
    echo "Location: $OUTPUT_DIR/$ARCHIVE_NAME"
else
    echo "Error creating archive"
    exit 1
fi
