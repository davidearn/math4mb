LectureSchedule.md: LectureSchedule.csv LectureScheduleCSVtoMD.R
	time R CMD BATCH --vanilla LectureScheduleCSVtoMD.R
	cp LectureSchedule.md ../gh-pages/lectures/
	git add LectureSchedule.md
	git commit -m "lecture schedule update"
	git push

%.tex: %.Rnw coursefuns.R
	Rscript -e "library(knitr); knit('$*.Rnw')"
%.pdf: %.tex 4mbl00.tex LectureSchedule.csv
	##if [-e $*.aux ]; then; pdflatex $*; fi;
	pdflatex -interaction batchmode $*
	##pdflatex $*
clean:
	rm -f unnamed*
	rm -f *.{aux,tikz,out,log,blg,toc,tex-e}
veryclean: clean
	rm -f *.Rout
	rm -f *.{nav,snm,vrb} *-tikzDictionary *-concordance.tex
fresh: veryclean
	rm -rf cache figure
