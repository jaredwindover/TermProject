PDF = pdflatex -interaction=errorstopmode

all : Report.pdf Presentation.pdf

%.pdf : %.tex MathNotes.sty Report.bib
	pdflatex $(basename $<)
	-bibtex $(basename $<)
	pdflatex $(basename $<)
	pdflatex $(basename $<)

.PHONY : clear clean
clean :
	rm -f \
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
