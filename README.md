# Motivationsschreiben PDF Generator (Markdown + Docker)

Dieses Projekt ermöglicht es, ein Motivationsschreiben als **Markdown-Datei** zu pflegen und daraus mit **Pandoc + LaTeX in Docker** ein fertiges PDF zu erzeugen.  
Perfekt, um schnell verschiedene Versionen für unterschiedliche Firmen zu erstellen, ohne Formatierungsaufwand.

---

## 📂 Projektstruktur

```
motivationsschreiben_template/
│
├── letter.md               # Dein Motivationsschreiben (Markdown)
├── letter.tex               # LaTeX-Vorlage für das Layout
├── Dockerfile               # Docker Image mit Pandoc + LaTeX
├── docker_build.sh          # Skript zum PDF-Bau im Container
├── docker-compose.yml       # Optional: Einfacher Aufruf per Compose
└── README.md                # Diese Anleitung
```

---

## 🛠 Voraussetzungen
- **Docker** installiert  
  Prüfen:
  ```bash
  docker --version
  ```
- Optional: **Docker Compose** für kürzere Befehle

---

## 🚀 Nutzung

### 1. Image bauen
```bash
docker build -t motiv-letter .
```

### 2. PDF erzeugen
Im Projektordner ausführen:
```bash
docker run --rm -v "$PWD":/work motiv-letter letter.md Motivationsschreiben.pdf
```
- `letter.md` = Eingabedatei  
- `Motivationsschreiben.pdf` = Ausgabedatei

Das PDF liegt danach im gleichen Ordner.

---

## 💡 Mit Docker Compose
```bash
docker compose run --rm letter letter.md Motivationsschreiben.pdf
```

---

## ✏ Anpassung für neue Firmen
1. Öffne `letter.md`  
2. Ändere die Werte im **YAML-Kopfbereich**:
   ```yaml
   recipient_company: Neue Firma GmbH
   recipient_name: Herr Max Muster
   recipient_address: Musterstrasse 1, 8000 Zürich
   subject: Bewerbung als Projektleiter
   date: 15. August 2025
   city: Zürich
   closing: Mit freundlichen Grüssen
   ```
3. Passe den Haupttext an  
4. Erneut PDF bauen

---

## 🎨 Vorlage ändern
- `letter.tex` enthält das Layout  
- Wenn du sie änderst, wird diese lokale Datei statt der Standardvorlage im Image genutzt.

---

## 🔄 Anderen Dateinamen nutzen
```bash
docker run --rm -v "$PWD":/work motiv-letter meinbrief.md Bewerbung-NeueFirma.pdf
```

---

## 🧹 Aufräumen
Nicht mehr benötigte Docker-Images entfernen:
```bash
docker rmi motiv-letter
```
