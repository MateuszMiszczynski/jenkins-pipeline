#!/usr/bin/env python3
import argparse
import os
import shutil

def sort_folder(folder_path):
    if not os.path.isdir(folder_path):
        print(f"Ścieżka {folder_path} nie istnieje.")
        return
    for filename in os.listdir(folder_path):
        ext = os.path.splitext(filename)[1].lstrip('.').lower()
        if not ext:
            ext = 'no_ext'
        target_dir = os.path.join(folder_path, ext)
        os.makedirs(target_dir, exist_ok=True)
        shutil.move(os.path.join(folder_path, filename), os.path.join(target_dir, filename))

def main():
    parser = argparse.ArgumentParser(description="Sortuj pliki w folderze według rozszerzeń")
    parser.add_argument('folder', help="Ścieżka do katalogu z plikami")
    args = parser.parse_args()
    sort_folder(args.folder)

if __name__ == "__main__":
    main()

