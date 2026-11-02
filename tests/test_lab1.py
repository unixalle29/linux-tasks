def test_lab1_tasks(run_lab) -> None:
    result = run_lab("lab1")
    assert result.returncode == 0
    assert "=== Task 1" in result.stdout
    assert "XDG_CURRENT_DESKTOP=" in result.stdout
    assert "=== Task 8" in result.stdout
    assert "2018" in result.stdout
    assert "=== Task 10" in result.stdout
    assert "uid=" in result.stdout
    assert "=== Task 14" in result.stdout
    assert "child terminated" in result.stdout
    assert "=== Task 17" in result.stdout
    assert "USER" in result.stdout
