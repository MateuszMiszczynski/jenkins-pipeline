#!/usr/bin/env bats

# Test setup: utwórz tymczasowy katalog
setup() {
  TEST_DIR="test_env"
  mkdir -p "$TEST_DIR"
}

# Sprzątanie po testach
teardown() {
  rm -rf "$TEST_DIR"
}

@test "Skrypt tworzy pliki .txt i .jpg" {
  run bash scripts/generate_files.sh "$TEST_DIR"
  [ "$status" -eq 0 ]             # skrypt zakończony sukcesem
  [ -f "$TEST_DIR/file1.txt" ]
  [ -f "$TEST_DIR/image1.jpg" ]
}

