#!/usr/bin/env bash
set -euo pipefail

INPUT="/app/input.txt"

# No-op entrypoint: only check input exists. Agents must produce output.
if [ ! -f "$INPUT" ]; then
  exit 1
fi

exit 0