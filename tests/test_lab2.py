def test_lab2_tasks(run_lab) -> None:
    result = run_lab("lab2")
    assert result.returncode == 0
    assert "=== Task 1" in result.stdout
    assert "File: lab1_file.txt" in result.stdout
    assert "File name too long" in result.stdout
    assert "my file.txt" in result.stdout
    assert "today.$$$" in result.stdout
    assert "-now!" in result.stdout
    assert "744" in result.stdout
    assert "640" in result.stdout
    assert "user:ivanov:rw-" in result.stdout
    assert "user:petrov:r--" in result.stdout
    assert "mask::" in result.stdout


def test_lab2_runs_as_student(run_lab) -> None:
    result = run_lab("lab2", "id", "-un")
    assert result.returncode == 0
    assert result.stdout.strip() == "student"
