# Docker Workflow

## Bauen
docker build -t motiv-letter .

## PDF erzeugen (PWD wird gemountet)
docker run --rm -v "$PWD":/work motiv-letter letter.md Motivationsschreiben.pdf

## Alternativ: docker compose
docker compose run --rm letter letter.md Motivationsschreiben.pdf
