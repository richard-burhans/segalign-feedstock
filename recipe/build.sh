#!/usr/bin/env bash

set -o errexit
set -o nounset

BUILD_DIR="$SRC_DIR/build"
BIN_DIR="$PREFIX/bin"

mkdir -p "$BUILD_DIR"
cd "$BUILD_DIR"

cmake ${CMAKE_ARGS} -DCMAKE_BUILD_TYPE=Release "$SRC_DIR"
make

install --mode 0755 --directory "$BIN_DIR"
install --mode 0755 $SRC_DIR/build/segalign{,_repeat_masker} "$BIN_DIR"
install --mode 0755 $SRC_DIR/scripts/run_segalign{,_repeat_masker} "$BIN_DIR"
