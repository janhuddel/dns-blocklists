#!/bin/bash

# Script zum Sortieren aller .txt Dateien im aktuellen Verzeichnis

# Finde alle .txt Dateien und sortiere sie
for file in *.txt; do
    # Prüfe ob Datei existiert (falls keine .txt Dateien vorhanden sind)
    if [ ! -f "$file" ]; then
        echo "Keine .txt Dateien gefunden."
        exit 0
    fi
    
    echo "Sortiere: $file"
    
    # Sortiere die Datei, entferne Duplikate und leere Zeilen
    # Speichere in temporärer Datei
    sort -u "$file" | grep -v '^[[:space:]]*$' > "${file}.tmp"
    
    # Ersetze Originaldatei mit sortierter Version
    mv "${file}.tmp" "$file"
    
    echo "  ✓ $file sortiert"
done

echo ""
echo "Alle Listen wurden sortiert!"

