# Variables
PANDOC = pandoc
DOCS_DIR = docs
SRC_DIR = src
BUILD_DIR = build
PDF_NAME = rapport.pdf

# Liste des chapitres (ordre important)
CHAPTERS = $(DOCS_DIR)/00-introduction.md \
           $(DOCS_DIR)/01-etat-de-lart.md \
           $(DOCS_DIR)/02-methodologie.md \
           $(DOCS_DIR)/03-resultats.md \
           $(DOCS_DIR)/04-conclusion.md

# Options Pandoc
PANDOC_OPTS = --pdf-engine=xelatex \
              --template=docs/template.tex \
              --bibliography=$(DOCS_DIR)/references.bib \
              --csl=apa.csl \
              --citeproc \
              --number-sections \
              --toc \
              --toc-depth=3 \
              -V geometry:margin=2.5cm \
              -V fontsize=11pt \
              -V mainfont="DejaVu Serif" \
              -V sansfont="DejaVu Sans" \
              -V monofont="DejaVu Sans Mono" \
              -V colorlinks=true \
              -V linkcolor=blue

.PHONY: all pdf html clean watch install-deps

# Commande par défaut
all: pdf

# Génération PDF
pdf: $(BUILD_DIR)/$(PDF_NAME)

$(BUILD_DIR)/$(PDF_NAME): $(CHAPTERS) $(DOCS_DIR)/references.bib
	@mkdir -p $(BUILD_DIR)
	$(PANDOC) $(CHAPTERS) -o $@ $(PANDOC_OPTS)
	@echo "✅ PDF généré : $@"

# Génération HTML (pour GitLab Pages)
html:
	@mkdir -p $(BUILD_DIR)/html
	$(PANDOC) $(CHAPTERS) -o $(BUILD_DIR)/html/index.html \
		--standalone \
		--metadata title="Documentation Projet" \
		--css=style.css \
		--toc \
		--bibliography=$(DOCS_DIR)/references.bib \
		--citeproc
	@echo "✅ HTML généré dans $(BUILD_DIR)/html/"

# Nettoyage
clean:
	rm -rf $(BUILD_DIR)
	find . -name "*.aux" -delete
	find . -name "*.log" -delete
	find . -name "*.out" -delete
	find . -name "*.toc" -delete

# Watch mode (recompile à chaque sauvegarde)
watch:
	@echo "👀 Surveillance des fichiers Markdown..."
	@while true; do \
		make pdf; \
		sleep 2; \
	done

# Installation dépendances (Ubuntu/Debian)
install-deps:
	sudo apt-get update
	sudo apt-get install -y pandoc texlive-xetex texlive-fonts-recommended texlive-latex-extra