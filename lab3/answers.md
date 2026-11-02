# Lab 3. Разработка и компиляция программ

## Задание 1

Стадии: `gcc -E hello.c > hello.i`, `gcc -S hello.c` (hello.s),
`gcc -c hello.c` (hello.o), `gcc hello.c -o hello`.
`nm hello.o`: неразрешённые и определённые символы объектного модуля,
`nm hello`: символы готовой программы.

## Задание 2

`gcc -g sum.c -o sum`, затем в `gdb`: `break 5`, `run`, `print i`, `print sum`,
`continue`. Счётчик и сумма видны на итерации цикла.

## Задание 3

Проект `integral` состоит из `main.c`, `integral.c`, `function.c` и `integral.h`.
Сборка — `make`, запуск — `./build/integral`. Интеграл `x^2` на `[0, 1]` равен
`1/3`.

## Задание 4

Для внешних архивов:
`tar -xjf archive.tar.bz2`, `./configure --prefix=$HOME/soft`,
`make`, `make install`. Затем запуск установленной программы из `~/soft/bin`.
