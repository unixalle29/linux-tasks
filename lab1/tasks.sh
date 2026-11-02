#!/bin/bash

echo "=== Task 1: window manager ==="
echo "XDG_CURRENT_DESKTOP=${XDG_CURRENT_DESKTOP:-unknown}"

echo "=== Task 5: history and completion ==="
echo "x-commands: $(compgen -c | grep '^x' | sort -u | wc -l)"
echo "history lines: $(history 2>/dev/null | wc -l)"

echo "=== Task 7: escaping ==="
echo 1\&2\
345
echo '123
45'
echo 1    2 3 4    5
echo " 1 2"\ \ 3'  4'   5

echo "=== Task 8: date ==="
date
date +%Y-%m-%d
date -u
date --date='2018-03-13'
printf '2018-03-13\n2019-01-01\n' > dates.txt
date --file=dates.txt

echo "=== Task 9: information commands ==="
who
w
uname -a
type help
hostname
tty

echo "=== Task 10: user and groups ==="
id
whoami
groups
id -un
id -Gn

echo "=== Task 11: files for vi ==="
printf 'Student: %s\nGroup: 21118\n' "$(whoami)" > about_me.txt
printf 'PetrSU, Institute of Physics and Technology\n' > study.txt
cat about_me.txt study.txt

echo "=== Task 12: ps aux ==="
ps aux | head -5

echo "=== Task 13: cpu load ==="
ps -eo pid,%cpu,comm --sort=-%cpu | head -5

echo "=== Task 14: signals ==="
bash -c 'sleep 30' &
child=$!
echo "child pid=$child"
ps -p "$child" -o pid,stat,cmd
kill -TERM "$child"
wait "$child" 2>/dev/null || true
echo "child terminated"

echo "=== Task 15: background job ==="
sleep 2 &
job=$!
echo "background pid=$job"
jobs
kill "$job"
wait "$job" 2>/dev/null || true
echo "job terminated"

echo "=== Task 17: ps and tr ==="
ps aux | tr '[:lower:]' '[:upper:]' > ps.txt
head -3 ps.txt

echo "=== done ==="
