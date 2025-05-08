from pathlib import Path

import pytest


@pytest.fixture
def tmp_dir(tmp_path_factory: pytest.TempPathFactory) -> Path:
    return tmp_path_factory.mktemp("temp_test_dir")
