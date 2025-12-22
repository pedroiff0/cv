# Makefile to build separate English and Portuguese CV PDFs
# Usage:
#   make englishCV      -> builds englishCV.pdf
#   make portugueseCV   -> builds portugueseCV.pdf
#   make all            -> builds both
#   make clean          -> removes generated PDFs and aux files

SHELL := /bin/bash
LATEXMK := latexmk -xelatex -interaction=nonstopmode -halt-on-error
MAIN := main.tex

ENG_SRC := main_english.tex
POR_SRC := main_portuguese.tex

ENG_PDF := englishCV.pdf
POR_PDF := portugueseCV.pdf

.PHONY: all englishCV portugueseCV clean
all: englishCV portugueseCV

# Build English CV: prefer an existing $(ENG_SRC), otherwise create a temporary copy and compile
$(ENG_PDF): $(MAIN) english.tex
	@echo "Building $@..."
	@if [ -f $(ENG_SRC) ]; then \
	  echo "Using existing $(ENG_SRC)"; \
	  $(LATEXMK) -jobname=$(basename $@) $(ENG_SRC); \
	else \
	  grep -v "\\\input{portuguese.tex}" $(MAIN) > $(ENG_SRC); \
	  $(LATEXMK) -jobname=$(basename $@) $(ENG_SRC); \
	  rm -f $(ENG_SRC); \
	fi
	@latexmk -c -jobname=$(basename $@) $(ENG_SRC) >/dev/null 2>&1 || true
	@rm -f "$(basename $@).run" "$(basename $@).bcf" "$(basename $@).bcf-SAVE-ERROR" "$(basename $@).bcf*" "$(basename $@).xml" "$(basename $@).synctex.gz" "$(basename $@).bbl" "$(basename $@).blg" 2>/dev/null || true

englishCV: $(ENG_PDF)
	@echo "Generated $(ENG_PDF)"

# Build Portuguese CV: prefer an existing $(POR_SRC), otherwise create a temporary copy and compile
$(POR_PDF): $(MAIN) portuguese.tex
	@echo "Building $@..."
	@if [ -f $(POR_SRC) ]; then \
	  echo "Using existing $(POR_SRC)"; \
	  $(LATEXMK) -jobname=$(basename $@) $(POR_SRC); \
	else \
	  grep -v "\\\input{english.tex}" $(MAIN) > $(POR_SRC); \
	  $(LATEXMK) -jobname=$(basename $@) $(POR_SRC); \
	  rm -f $(POR_SRC); \
	fi
	@latexmk -c -jobname=$(basename $@) $(POR_SRC) >/dev/null 2>&1 || true
	@rm -f "$(basename $@).run" "$(basename $@).bcf" "$(basename $@).bcf-SAVE-ERROR" "$(basename $@).bcf*" "$(basename $@).xml" "$(basename $@).synctex.gz" "$(basename $@).bbl" "$(basename $@).blg" 2>/dev/null || true

portugueseCV: $(POR_PDF)
	@echo "Generated $(POR_PDF)"

clean:
	@echo "Cleaning generated PDFs and auxiliary files..."
	@rm -f $(ENG_PDF) $(POR_PDF) *.aux *.log *.fdb_latexmk *.fls *.out *.toc *.synctex.gz *.run *.bcf *.xml *.bcf-SAVE-ERROR *.bbl *.blg
	@latexmk -c >/dev/null 2>&1 || true
	@echo "Done."
