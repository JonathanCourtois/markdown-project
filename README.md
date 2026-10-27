# 🚀 Nom du Projet

> Description courte du projet (1-2 lignes)

[![Pipeline Status](https://gitlab.com/ton-username/ton-projet/badges/main/pipeline.svg)](https://gitlab.com/ton-username/ton-projet/-/pipelines)
[![Documentation](https://img.shields.io/badge/docs-latest-blue)](https://ton-username.gitlab.io/ton-projet/)

## 📋 Table des matières

- [Installation](#installation)
- [Utilisation](#utilisation)
- [Documentation](#documentation)
- [Structure du projet](#structure-du-projet)
- [Contribution](#contribution)

## 🛠️ Installation

```bash
# Cloner le repo {#cloner-le-repo  data-source-line="397"}
git clone https://gitlab.com/ton-username/ton-projet.git
cd ton-projet

# Installer les dépendances (si Python) {#installer-les-dépendances-si-python  data-source-line="401"}
pip install -r requirements.txt

# Installer Pandoc pour la doc (Ubuntu/Debian) {#installer-pandoc-pour-la-doc-ubuntudebian  data-source-line="404"}
sudo apt-get install pandoc texlive-xetex
``` {data-source-line="406"}

## 💻 Utilisation

```bash
# Lancer le code {#lancer-le-code  data-source-line="411"}
python src/main.py

# Générer la documentation PDF {#générer-la-documentation-pdf  data-source-line="414"}
make pdf

# Mode développement (recompile auto) {#mode-développement-recompile-auto  data-source-line="417"}
make watch
``` {data-source-line="419"}

## 📚 Documentation

La documentation complète est dans le dossier [`docs/`](docs/).

| Chapitre      | Description             | Lien                            |
| ------------- | ----------------------- | ------------------------------- |
| Introduction  | Contexte et objectifs   | [Lire](docs/00-introduction.md) |
| État de l'art | Revue de littérature    | [Lire](docs/01-etat-de-lart.md) |
| Méthodologie  | Approche technique      | [Lire](docs/02-methodologie.md) |
| Résultats     | Expériences et analyses | [Lire](docs/03-resultats.md)    |

**📄 Télécharger le PDF complet** : [rapport.pdf](build/rapport.pdf) *(généré automatiquement)*

## 🗂️ Structure du projet

mon-projet/
├── docs/ # Documentation Markdown + Biblio
├── src/ # Code source
├── tests/ # Tests unitaires
├── scripts/ # Scripts utilitaires
└── Makefile # Commandes de build

## 🤝 Contribution

1. Fork le projet
2. Crée une branche (`git checkout -b feature/ma-feature`)
3. Commit tes changements (`git commit -m 'Ajout de ma feature'`)
4. Push (`git push origin feature/ma-feature`)
5. Ouvre une Merge Request

## 📖 Références

Voir [docs/references.bib](docs/references.bib) pour la bibliographie complète.

---
*Dernière mise à jour : 26 octobre 2026*