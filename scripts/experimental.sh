#!/bin/bash
# experimental.sh - prosty skrypt eksperymentalny dla branch dev

TARGET_DIR="experimental_test_dir"
mkdir -p "$TARGET_DIR"

# Tworzymy kilka plików testowych
echo "Hello from experimental.sh" > "$TARGET_DIR/file1.txt"
echo "Another experimental file" > "$TARGET_DIR/file2.txt"

# Tworzymy plik do usunięcia później (pokazujemy cleanup)
touch "$TARGET_DIR/temp_file.log"

echo "Experimental script ran successfully in $TARGET_DIR"
