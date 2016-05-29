LATEX = xelatex -shell-escape -synctex=1 -interaction nonstopmode -file-line-error
BIBTEX = bibtex
SVG2PDF = rsvg-convert -f pdf -o

.PHONY: all clean pdfassets 

all: talk.pdf

talk.pdf: pdfassets | talk.tex.firstlatexrun.aux talk.bbl talk.tex.secondrun.aux talk.tex
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
	for i in `find assets -name '*.pdf'`; do \
		rm $$i; \
	done
# SVG to PDF

svgs := $(wildcard assets/*.svg) $(wildcard assets/on_disk/*.svg) $(wildcard assets/on_disk/cow/*.svg)

pdfassets: $(svgs:%.svg=%.pdf)
%.pdf : %.svg
	rsvg-convert -f pdf -o $*.pdf $*.svg


