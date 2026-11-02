#!/bin/bash

shopt -s expand_aliases

echo "=== Task 1: shell configuration files ==="
ls -la ~/.bash* /etc/profile /etc/bash.bashrc 2>/dev/null || true

echo "=== Task 2: variables ==="
A=123
echo "$A"
A=A+1
echo "$A"
declare -i A=123
A=A+1
echo "$A"

echo "=== Task 3: positional parameters ==="
set -- a b c d e f g h i j k l m n
echo "10: $10 ${10}"
echo "count before: $#"
set "$@"
echo "count after \"\$@\": $#"
set "$*"
echo "count after \"\$*\": $#"
echo "first: $1"

echo "=== Task 4: shell variables ==="
echo "BASH=$BASH"
echo "BASH_VERSION=$BASH_VERSION"
echo "BASH_VERSINFO=${BASH_VERSINFO[*]}"
echo "HOSTNAME=$HOSTNAME"
echo "HOSTTYPE=$HOSTTYPE"
echo "MACHTYPE=$MACHTYPE"
echo "OSTYPE=$OSTYPE"
echo "PWD=$PWD"
echo "RANDOM=$RANDOM"
echo "REPLY=$REPLY"
echo "SHLVL=$SHLVL"
echo "UID=$UID"
echo "HOME=$HOME"
echo "LANG=$LANG"
echo "PATH=$PATH"
echo "PS1=$PS1"
echo "PS2=$PS2"
echo "PS3=$PS3"

echo "=== Task 5: PS1 with time ==="
PS1='[\t] \u@\h \w\$ '
echo "$PS1"
echo "Persist: add this PS1 to ~/.bashrc"

echo "=== Task 6: aliases ==="
alias COPY='cp'
alias REN='mv'
alias DEL='rm'
alias

echo "=== Task 7: command lookup ==="
type help
type ls
command -v ls
builtin echo "builtin echo works"
enable -a | head -5

echo "=== Task 8: hidden directories ==="
mkdir -p .hidden_a .hidden_b
du -hs .[!.]* 2>/dev/null
rmdir .hidden_a .hidden_b

echo "=== Task 9: for sum ==="
sum=0
for number in {1..10}; do
    sum=$((sum + number))
done
echo "sum=$sum"

echo "=== Task 10: if instead of && and || ==="
if true; then
    echo "cmd1 && cmd2: true branch"
fi
if ! false; then
    echo "cmd1 || cmd2: true branch"
fi

echo "=== Task 11: remove all characters ==="
ZZZ=1qwerty2qwerty3qwerty
echo "removed=[${ZZZ//?/}]"

echo "=== Task 12: BASH variables ==="
for name in ${!BASH*}; do
    echo "$name=${!name}"
done

echo "=== Task 13: command substitution ==="
A=$(ls)
echo "$A" | head -3
[ -f ~/.bash_history ] || printf 'ls\ncd\n' > ~/.bash_history
B=$(<~/.bash_history)
echo "$B" | head -3

echo "=== Task 14: arithmetic ==="
A=2#111
let A++
printf '%o\n' "$A"

echo "=== Task 15: test ==="
[ -f /tmp/123 ] && rm -f /tmp/123
[ -d /tmp/345 ] || mkdir /tmp/345
ls -ld /tmp/345

echo "=== Task 16: variant script ==="
./variant.sh 1 2 3 4

echo "=== done ==="
