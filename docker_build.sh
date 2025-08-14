#!/usr/bin/env bash
set -euo pipefail

INPUT="${1:-letter.md}"
OUTPUT="${2:-Motivationsschreiben.pdf}"

# If user mounted an external template, prefer it
TEMPLATE="/opt/template/letter.tex"
if [[ -f "/work/letter.tex" ]]; then
  TEMPLATE="/work/letter.tex"
fi

if [[ ! -f "/work/${INPUT}" ]]; then
  echo "Eingabe nicht gefunden: ${INPUT} im gemounteten /work"
  echo "Tipp: docker run -v \"$PWD\":/work IMAGE ${INPUT} ${OUTPUT}"
  exit 1
fi

cd /work

pandoc "$INPUT" \
  --template="$TEMPLATE" \
  -V lang=de \
  -V papersize=a4 \
  -V geometry:margin=2.5cm \
  -o "$OUTPUT"

echo "Fertig: $OUTPUT"
