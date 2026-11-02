#!/bin/bash

echo "=== Task 1: compilation stages ==="
cat > hello.c <<'EOF'
#include <stdio.h>

int main(void) {
    printf("hello, world\n");
    return 0;
}
EOF

gcc -E hello.c > hello.i
gcc -S hello.c
gcc -c hello.c
gcc hello.c -o hello
./hello
echo "--- nm hello.o"
nm hello.o
echo "--- nm hello"
nm hello | head -20

echo "=== Task 2: gdb ==="
cat > sum.c <<'EOF'
#include <stdio.h>

int main(void) {
    int sum = 0;
    for (int i = 1; i <= 10; i++) {
        sum += i;
    }
    printf("sum = %d\n", sum);
    return 0;
}
EOF

gcc -g -Wall -Wextra sum.c -o sum
./sum
gdb -q -batch -ex 'break 5' -ex run -ex 'print i' -ex 'print sum' -ex continue ./sum

echo "=== Task 3: integral project ==="
make clean
make
./build/integral

echo "=== Task 4: configure/build ==="
echo "Downloading and installing external archives requires network access."
echo "See answers.md for the configure/make/install procedure."

echo "=== done ==="
