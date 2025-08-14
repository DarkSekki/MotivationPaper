# Motivation Letter PDF Generator (Split Version)

Dieses Projekt trennt das Motivationsschreiben in **statische** und **variable** Inhalte, damit du nur noch die variable Datei pro Bewerbung anpassen musst.

## 📂 Struktur

```
motivation_letter_split/
│
├── letter_static.md       # Fester Inhalt: deine Daten, "Warum ich", Schluss
├── letter_variable.md     # Variabler Inhalt: Firmendaten, Einleitung, "Warum Ihr Unternehmen"
├── letter.tex             # LaTeX-Template für das Layout
├── build.sh               # Skript zum Erzeugen eines PDFs mit Pandoc
├── Dockerfile             # Docker-Image mit Pandoc + LaTeX
└── docker-compose.yml     # Optional: einfacher Aufruf mit Docker Compose
```

---

## 🛠 Voraussetzungen

### Lokal (ohne Docker)
- Pandoc
- LaTeX (texlive)

Installation unter Ubuntu:
```bash
sudo apt update
sudo apt install -y pandoc texlive-latex-recommended texlive-latex-extra texlive-fonts-recommended
```

### Mit Docker
- Docker
- (Optional) Docker Compose

---

## 🚀 Nutzung

### 1. Statische Daten anpassen
In `letter_static.md` einmalig deine Daten eintragen:
- Name, Adresse, Telefonnummer, E-Mail
- Dein "Warum ich"
- Standard-Schluss

### 2. Variable Daten pro Bewerbung anpassen
In `letter_variable.md`:
- Datum, Stadt
- Firma, Ansprechpartner, Adresse
- Stellenbezeichnung
- Individuelle Einleitung
- "Warum Ihr Unternehmen"

### 3. PDF erzeugen

#### Lokal (ohne Docker)
```bash
./build.sh letter_variable.md letter_static.md Bewerbung-FirmaXYZ.pdf
```

#### Mit Docker Compose
Image bauen:
```bash
docker compose build
```
PDF erzeugen:
```bash
docker compose run --rm letter letter_variable.md letter_static.md Bewerbung-FirmaXYZ.pdf
```

Das PDF liegt danach im Projektordner.

---

## 💡 Tipps
- Du kannst beliebig viele `letter_variable.md`-Dateien für verschiedene Bewerbungen anlegen.
- Das LaTeX-Template `letter.tex` kannst du an dein gewünschtes Layout anpassen.
- Mit Docker musst du keine lokale LaTeX/Pandoc-Installation vornehmen.

---

## 📜 Lizenz
Frei für private und kommerzielle Nutzung.
