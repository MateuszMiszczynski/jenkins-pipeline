#!/bin/bash
# Usage: ./scripts/generate_files.sh <katalog_docelowy>
TARGET_DIR="$1"
mkdir -p "$TARGET_DIR"
# Utwórz przykładowe pliki tekstowe i obrazki
touch "$TARGET_DIR/file1.txt" "$TARGET_DIR/file2.txt"
touch "$TARGET_DIR/image1.jpg" "$TARGET_DIR/photo.png"
echo "Przykładowe pliki utworzone w $TARGET_DIR"

