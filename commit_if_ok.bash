#!/usr/bin/env bash

set -euo pipefail

# ./commit_if_ok.bash 42
# Then trying to build exercise No.42, and commit if passed

exercise="$1"

zig build "$exercise" && git commit -a -m "OK \'zig build $exercise\`"
