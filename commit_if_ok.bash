#!/usr/bin/env bash

set -euo pipefail

# ./commit_if_ok.bash 42
# Then trying to build exercise No.42, and commit if passed

exercise="$1"
tmpfile="$(mktemp)"

# `zig build number` exit 0 even if faling the build!
zig build "$exercise" 2>&1 | tee --append "$tmpfile"
(grep -P '^PASSED:' < "$tmpfile") && git commit -a -m "OK \'zig build $exercise\`"
