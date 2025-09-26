#!/bin/bash

set -eoux pipefail

clear
#rm -rf _build || true
cmake -B _build -S . -DUSE_INTERNAL_FPCONV=ON -DUSE_LUAU=ON -DCOMPILE_LUAU_TEST=ON
cmake --build _build
cd tests
../_build/luau_test luau_test.lua

