LATEX = xelatex -shell-escape -synctex=1 -interaction nonstopmode -file-line-error
BIBTEX = bibtex
SVG2PDF = rsvg-convert -f pdf -o

.PHONY: all clean pdfassets 

all: talk.pdf

talk.pdf: pdfassets | talk.tex.firstlatexrun.aux talk.bbl talk.tex.secondrun.aux talk.tex
	$(LATEX) talk

talk.tex.firstlatexrun.aux:
	$(LATEX) talk
	-touch talk.tex.firstlatexrun.aux

talk.tex.secondrun.aux:
	$(LATEX) talk
	-touch talk.tex.secondrun.aux

talk.bbl: bibliography.bib
	$(BIBTEX) talk

clean: 
	for i in `git ls-files -ico -X .gitignore`; do \
	       	rm "$$i"; \
	done
	for i in `find assets -name '*.pdf'`; do \
		rm $$i; \
	done
# SVG to PDF

svgs := $(shell find assets -name '*.svg')

pdfassets: $(svgs:%.svg=%.pdf)
%.pdf : %.svg
	inkscape -A $*.pdf $*.svg


