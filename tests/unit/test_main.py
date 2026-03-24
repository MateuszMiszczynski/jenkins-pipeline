import os
import shutil
import tempfile
import pytest
from src.main import sort_folder

def test_sort_folder_moves_files(tmp_path):
    # Przygotuj tymczasowy katalog z plikami
    test_dir = tmp_path / "data"
    test_dir.mkdir()
    (test_dir / "a.txt").write_text("abc")
    (test_dir / "b.log").write_text("log")
    # Wykonaj sortowanie
    sort_folder(str(test_dir))
    # Sprawdź, czy powstały odpowiednie foldery i pliki są przeniesione
    txt_dir = test_dir / "txt"
    log_dir = test_dir / "log"
    assert txt_dir.is_dir()
    assert log_dir.is_dir()
    assert (txt_dir / "a.txt").exists()
    assert (log_dir / "b.log").exists()

