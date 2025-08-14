#!/usr/bin/env sh
set -euo pipefail

if ! command -v pandoc >/dev/null 2>&1; then
  echo "Pandoc ist nicht installiert."
  exit 1
fi

VARIABLE_FILE="${1:-letter_variable.md}"
STATIC_FILE="${2:-letter_static.md}"
OUTPUT="${3:-Motivationsschreiben.pdf}"

cd "$(dirname "$0")"

pandoc "$VARIABLE_FILE" "$STATIC_FILE"   --template=letter.tex   -V lang=de   -V papersize=a4   -V geometry:margin=2.5cm   -o "$OUTPUT"

echo "Fertig: $OUTPUT"
