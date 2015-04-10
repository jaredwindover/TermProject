PDF = pdflatex -interaction=errorstopmode

.PHONY : clear clean all
all : Report.pdf Presentation.pdf

FIXDOLLARS = perl -p FixDollars.pl

%.pdf : %.tex MathNotes.sty Report.bib
	pdflatex $(basename $<)
	-bibtex $(basename $<)
	pdflatex $(basename $<)
	pdflatex $(basename $<)

%.tex : %.pre
	${FIXDOLLARS} <$< > $@

clean :
	rm -f \
	*.tex \
	*.aux \
	*.nav \
	*.log \
	*.out \
	*.snm \
	*.toc \
	*.dvi \
	*.bbl \
	*.blg \
	*-blx.bib \
	*.run.xml \
	*~
clear : clean
	rm -f *.pdf
