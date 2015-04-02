all : Report.pdf Presentation.pdf

%.pdf : %.tex MathNotes.sty
	pdflatex $<

.PHONY : clean
clean :
	rm *.aux *.nav *.log *.out *.snm *.toc *~
