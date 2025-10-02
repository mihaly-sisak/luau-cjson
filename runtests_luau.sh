#!/bin/bash

set -eoux pipefail

clear
#rm -rf _build || true
cmake -G Ninja -B _build -S . -DUSE_INTERNAL_FPCONV=ON -DUSE_LUAU=ON -DCOMPILE_LUAU_TEST=ON \
        -DCMAKE_BUILD_TYPE=RelWithDebInfo -DCMAKE_EXPORT_COMPILE_COMMANDS=ON
cmake --build _build --config RelWithDebInfo
cd tests
../_build/luau_test luau_test.lua

