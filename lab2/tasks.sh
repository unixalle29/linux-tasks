#!/bin/bash

echo "=== Task 1: stat and inode ==="
echo "hello" > lab1_file.txt
stat lab1_file.txt

echo "=== Task 2: long and special names ==="
long_name=$(printf 'a%.0s' {1..260})
{ date > "$long_name"; } 2> long_name_error.txt || true
cat long_name_error.txt
date > 'my file.txt'
date > 'today.$$$'
date > './-now!'
stat 'my file.txt' 'today.$$$' -- '-now!'

echo "=== Task 3: pwd ==="
pwd

echo "=== Task 4: cd ==="
cd /
pwd
cd ..
pwd
cd ~
pwd
cd ..
pwd
cd ~/informatics 2>/dev/null || cd ~
pwd

echo "=== Task 5: hidden files ==="
ls -la

echo "=== Task 6: cache size ==="
mkdir -p ~/.cache
du -sh ~/.cache

echo "=== Task 7: copy, move, remove, view ==="
mkdir -p files_lab2
cp 'my file.txt' 'today.$$$' './-now!' files_lab2/
cd files_lab2
mv 'my file.txt' renamed.txt
rm 'today.$$$'
cat renamed.txt
cd ..
rm -rf files_lab2

echo "=== Task 8: cat as editor ==="
cat > myfile.txt <<'EOF'
line one
line two
EOF
cat myfile.txt

echo "=== Task 9: chmod ==="
touch test_file
chmod u+w,og+rx test_file
stat -c '%A %a' test_file
chmod 744 test_file
stat -c '%A %a' test_file
chmod 640 test_file
stat -c '%A %a' test_file

echo "=== Task 10: grep /etc/passwd ==="
grep '/home' /etc/passwd

echo "=== Task 11: grep -E ==="
printf '23ex+\n--exxx\n???ex\n#exx\n...e\n' | grep -E '[^[:alnum:]]{2,3}ex+'

echo "=== Task 12: find ==="
find /tmp -type d 2>/dev/null | head
find /var -name log -ls 2>/dev/null | head
find /usr/include/linux -name '*.h' -exec grep -l foo '{}' ';' 2>/dev/null | head

echo "=== Task 13: small files in /usr ==="
find /usr -type f -size -4k -printf '%p %s\n' 2>/dev/null | head -10

echo "=== Task 15-17: ACL ==="
touch acl_file
setfacl -m u:ivanov:rw acl_file
setfacl -m u:petrov:r acl_file
getfacl acl_file
chmod g+w acl_file
getfacl acl_file
setfacl -n -m u:ivanov:r acl_file
getfacl acl_file

echo "=== done ==="
