#!/bin/bash

sum=0
for number in "$@"; do
    sum=$((sum + number))
done

echo "args=$#"
echo "sum=$sum"
