import shutil
import subprocess
from collections.abc import Callable
from pathlib import Path

import pytest

ROOT = Path(__file__).resolve().parents[1]
LABS = ("lab1", "lab2", "lab3", "lab4")


def docker_available() -> bool:
    if shutil.which("docker") is None:
        return False
    return subprocess.run(["docker", "info"], capture_output=True).returncode == 0


def pytest_collection_modifyitems(items: list[pytest.Item]) -> None:
    if docker_available():
        return
    skip = pytest.mark.skip(reason="docker is not available")
    for item in items:
        item.add_marker(skip)


@pytest.fixture(scope="session")
def images() -> None:
    for lab in LABS:
        image = f"linux-tasks-{lab}"
        result = subprocess.run(
            ["docker", "build", "-t", image, str(ROOT / lab)],
            capture_output=True,
            text=True,
        )
        if result.returncode != 0:
            pytest.fail(f"docker build failed for {lab}\n{result.stdout}\n{result.stderr}")


@pytest.fixture
def run_lab(images) -> Callable[..., subprocess.CompletedProcess[str]]:
    def run(lab: str, *command: str) -> subprocess.CompletedProcess[str]:
        return subprocess.run(
            ["docker", "run", "--rm", f"linux-tasks-{lab}", *command],
            capture_output=True,
            text=True,
        )

    return run
