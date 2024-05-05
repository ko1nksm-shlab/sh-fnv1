#!/bin/bash

. ./fnv.sh

echo "=== fnv1 (sh) ==="
time fnv1 < data.dat
echo


echo "=== fnv1 (go) ==="
if [ -x ./fnv1 ]; then
  time ./fnv1 < data.dat
else
  echo "skip"
fi
echo

echo "=== fnv1a (sh) ==="
time fnv1a < data.dat
echo

echo "=== fnv1a (go) ==="
if [ -x ./fnv1a ]; then
  time ./fnv1a < data.dat
else
  echo "skip"
fi
echo
