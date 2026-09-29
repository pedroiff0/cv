# Makefile to build separate CV PDFs with full bibliography (biber) support
# Each language file (portuguese.tex, english.tex, ...) is \input'ed into main.tex
# via a generated main_<lang>.tex, then compiled with a complete LaTeX+biber cycle.

SHELL := /bin/bash
MAIN := main.tex
LUALATEX := lualatex -interaction=nonstopmode
BIBER := biber

# language stems
LANGS := portuguese english spanish french

.PHONY: help all clean lint $(LANGS)

help: ## Exibe a lista de comandos disponíveis
	@echo "Comandos disponíveis em CV:"
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?## "}; {printf "  \033[36m%-18s\033[0m %s\n", $$1, $$2}'

all: $(addsuffix CV.pdf,$(LANGS)) ## Compila todos os currículos em PDF

lint: ## Valida existência dos arquivos TeX fonte
	@test -f main.tex && test -f altacv.cls
	@echo "Fontes LaTeX do CV validados com sucesso."

# Build each CV: generate main_<lang>.tex (main.tex minus its own \input lines,
# plus an \input{<lang>} right before \end{document}), then LaTeX -> biber -> LaTeX x2.
%CV.pdf: $(MAIN) %.tex
	@echo "Building $@..."
	@grep -v '\\input{' $(MAIN) > main_$*.tex
	@awk '/\\end\{document\}/{print "\\input{$*}"} {print}' main_$*.tex > main_$*.tex.tmp && mv main_$*.tex.tmp main_$*.tex
	$(LUALATEX) -jobname=$(basename $@) main_$*.tex
	$(BIBER) $(basename $@)
	$(LUALATEX) -jobname=$(basename $@) main_$*.tex
	$(LUALATEX) -jobname=$(basename $@) main_$*.tex
	@echo "Generated $@"
	@rm -f main_$*.tex *.aux *.log *.fdb_latexmk *.fls *.out *.toc *.synctex.gz *.run.xml *.bcf *.bbl *.blg

# Convenience aliases
portuguese: portugueseCV.pdf
english: englishCV.pdf
spanish: spanishCV.pdf
french: frenchCV.pdf

clean:
	rm -f main_*.tex *.aux *.log *.fdb_latexmk *.fls *.out *.toc *.synctex.gz *.run.xml *.bcf *.bbl *.blg *CV.pdf
