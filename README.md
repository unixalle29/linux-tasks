# linux-tasks

Лабы по Linux, ПетрГУ. В папках Dockerfile и `tasks.sh`.

## Запуск

```bash
uv sync
uv run pytest
```

Одна лаба:

```bash
docker build -t linux-tasks-lab1 lab1
docker run --rm linux-tasks-lab1
```

## Лабы

- `lab1` — команды, редиректы, `date`, `ps`, сигналы
- `lab2` — файлы, права, `grep`, `find`, ACL
- `lab3` — `gcc`, `nm`, `gdb`, интеграл
- `lab4` — переменные, aliases, globs, циклы
