def test_lab3_tasks(run_lab) -> None:
    result = run_lab("lab3")
    assert result.returncode == 0
    assert "=== Task 1" in result.stdout
    assert "hello, world" in result.stdout
    assert "nm hello.o" in result.stdout
    assert "=== Task 2" in result.stdout
    assert "sum = 55" in result.stdout
    assert "Breakpoint 1" in result.stdout
    assert "=== Task 3" in result.stdout
    assert "integral = 0.333333" in result.stdout
    assert "=== Task 4" in result.stdout


def test_lab3_has_gdb(run_lab) -> None:
    result = run_lab("lab3", "gdb", "--version")
    assert result.returncode == 0
    assert "GNU gdb" in result.stdout
