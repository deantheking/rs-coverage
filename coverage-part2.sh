#!/usr/bin/env bash

set -e

export RUSTFLAGS="-Cinstrument-coverage"
export LLVM_PROFILE_FILE="default-%p-%m.profraw"

cargo build
cargo test -p sub

mkdir tmp

file_name=coverage-part2.tar.bz2
tar cjvf "$file_name" $(find . \( -name "*.rcgu.o" -o -name "*.d" -o -name "*.profraw" \) -print0 | xargs -0)
buildkite-agent artifact upload "$file_name"
