CC ?= cc
CFLAGS ?= -std=c11 -Wall -Wextra

all: build/integral

build/integral: main.c integral.c function.c integral.h
	@mkdir -p build
	$(CC) $(CFLAGS) main.c integral.c function.c -o $@

run: build/integral
	@./build/integral

clean:
	rm -rf build hello hello.o hello.s hello.i sum

.PHONY: all run clean
