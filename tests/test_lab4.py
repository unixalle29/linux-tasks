def test_lab4_tasks(run_lab) -> None:
    result = run_lab("lab4")
    assert result.returncode == 0
    assert "=== Task 2" in result.stdout
    assert "124" in result.stdout
    assert 'count after "$@": 14' in result.stdout
    assert 'count after "$*": 1' in result.stdout
    assert "=== Task 8" in result.stdout
    assert ".hidden_a" in result.stdout
    assert "sum=55" in result.stdout
    assert "removed=[]" in result.stdout
    assert "=== Task 14" in result.stdout
    assert "10" in result.stdout
    assert "args=4" in result.stdout
    assert "sum=10" in result.stdout
