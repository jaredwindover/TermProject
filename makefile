PDF = pdflatex -interaction=errorstopmode

all : Report.pdf Presentation.pdf

%.pdf : %.tex MathNotes.sty
	pdflatex $(basename $<)
	-bibtex $(basename $<)
	pdflatex $(basename $<)
	pdflatex $(basename $<)

.PHONY : clean
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
	*~
