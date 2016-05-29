LATEX = xelatex -shell-escape -synctex=1 -interaction nonstopmode -file-line-error
BIBTEX = bibtex
SVG2PDF = rsvg-convert -f pdf -o

ASSETS = 

.PHONY: all clean

all: talk.pdf

talk.pdf: $(ASSETS) | talk.tex.firstlatexrun.aux talk.bbl talk.tex.secondrun.aux talk.tex
	$(LATEX) talk

talk.tex.firstlatexrun.aux:
	$(LATEX) talk

talk.tex.secondrun.aux:
	$(LATEX) talk

talk.bbl: bibliography.bib
	$(BIBTEX) talk

clean: 
	for i in `git ls-files -ico -X .gitignore`; do \
	       	rm "$$i"; \
	done
