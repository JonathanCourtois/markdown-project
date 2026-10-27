#!/bin/bash

error="false"
# Créer le dossier de sortie
mkdir -p build

# Créer un lien symbolique vers docs/assets pour éviter ma duplication.
if [ -d "docs/assets" ]; then
    rm -f -r build/assets  # Supprime l'ancien lien s'il existe
    ln -s ../docs/assets build/assets
    echo "Lien symbolique créé: build/assets -> ../docs/assets"
fi

# Compiler chaque fichier markdown
for file in docs/*.md; do
    filename=$(basename "$file" .md)
    echo "Compilation de $filename..."

    pandoc "$file" \
        --bibliography=docs/references.bib \
        --csl=docs/styles/apa.csl \
        --citeproc \
        --standalone \
        --metadata title="Documentation" \
        -o "build/${filename}.html" || {
    echo "❌ Erreur lors de la compilation de $file"
    error="true"
    }
done

if [ "$error" = "false" ]; then 
    echo "✅ Compilation terminée dans ./build/"
else
    echo "❌ Erreurs lors de la compilation ="
fi