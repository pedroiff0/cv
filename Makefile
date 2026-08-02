# Makefile to build separate CV PDFs

SHELL := /bin/bash
LATEXMK := latexmk -lualatex -interaction=nonstopmode
MAIN := main.tex

.PHONY: all englishCV portugueseCV spanishCV frenchCV clean distclean

all: englishCV portugueseCV spanishCV frenchCV

%CV.pdf: $(MAIN) %.tex
	@echo "Building $@..."
	@grep -v "\\input{" $(MAIN) | sed 's/\\end{document}/\\input{$*.tex}\n\\end{document}/' > main_$*.tex
	@$(LATEXMK) -jobname=$(basename $@) main_$*.tex
	@rm -f main_$*.tex *.aux *.log *.fdb_latexmk *.fls *.out *.toc *.synctex.gz *.run.xml *.bcf *.bbl *.blg 2>/dev/null || true

englishCV: englishCV.pdf
	@echo "Generated englishCV.pdf"

portugueseCV: portugueseCV.pdf
	@echo "Generated portugueseCV.pdf"

spanishCV: spanishCV.pdf
	@echo "Generated spanishCV.pdf"

frenchCV: frenchCV.pdf
	@echo "Generated frenchCV.pdf"

clean:
	@echo "Cleaning auxiliary files..."
	@rm -f *.aux *.log *.fdb_latexmk *.fls *.out *.toc *.synctex.gz *.run.xml *.bcf *.bbl *.blg
	@latexmk -c >/dev/null 2>&1 || true

distclean:
	@echo "Removing PDFs..."
	@rm -f *CV.pdf *.aux *.log *.fdb_latexmk *.fls *.out *.toc *.synctex.gz *.run.xml *.bcf *.bbl *.blg
	@latexmk -C >/dev/null 2>&1 || true
