#!/usr/bin/env bash
set -euo pipefail

INPUT="/app/input.txt"
OUTPUT="/app/output.txt"

if [ ! -f "$INPUT" ]; then
    echo "Input file missing at $INPUT" >&2
    exit 1
fi

tr 'A-Z' 'a-z' < "$INPUT" \
    | tr -cs 'a-z0-9' '\n' \
    | sort \
    | uniq -c \
    | sort -k2 \
    | awk '{print $2 ": " $1}' > "$OUTPUT"

ls -l "$OUTPUT"
cat "$OUTPUT"