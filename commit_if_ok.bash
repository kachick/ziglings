#!/usr/bin/env bash

set -euo pipefail

# ./commit_if_ok.bash 42
# Then trying to build exercise No.42, and commit if passed

exercise="$1"

# `zig build number` exit 0 even if faling the build!
(zig build "$exercise" 2>&1 | grep -P '^PASSED:') && git commit -a -m "OK \'zig build $exercise\`"
