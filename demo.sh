#!/bin/sh

. ./fnv.sh

LF="
"

echo "=== fnv1 ==="
echo "Hello World" | fnv1
# => 12a9a437
fnv1_str "Hello World${LF}" "Hello World${LF}"
echo

echo "=== fnv1a ==="
echo "Hello World" | fnv1a
# => d8ea85d7
fnv1a_str "Hello World${LF}" "Hello World${LF}"
echo
