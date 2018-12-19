4mbinfo_2019.pdf:

all: 4mbinfo_2019.pdf attendance.pdf

3ainfo_2017.pdf: 3atimetable_2017.tex

3atimetable.pdf: 3atimetable_2017.tex

%.tex: %.Rnw
	Rscript -e "library(knitr); knit('$*.Rnw')"
%.pdf: %.tex
	pdflatex $*
	pdflatex $*
clean:
	rm -f unnamed*
	rm -f *.{aux,tikz,out,log,blg,toc}
