DEFAULT_STEM ?= 4mbl_intro

LECTURE_DECKS := 4mbl_intro.pdf 4mbl_data.pdf 4mbl_recurrent.pdf \
	4mbl_R0.pdf 4mbl_space.pdf

## Prevent make from auto-deleting generated PDF/TeX files when building
## targets such as 4mbl_intro.open.
.PRECIOUS: %.pdf %.tex

.PHONY: all open publish-schedule clean veryclean fresh

all: $(LECTURE_DECKS)

open: $(DEFAULT_STEM).open

## Open an individual lecture PDF on macOS.
%.open: %.pdf
	open "$<"

LectureSchedule.md: LectureSchedule.csv LectureScheduleCSVtoMD.R
	Rscript LectureScheduleCSVtoMD.R

## Publication is deliberately separate from schedule generation. This target
## copies only the generated schedule; committing and pushing remain explicit
## user operations.
publish-schedule: LectureSchedule.md
	cp LectureSchedule.md gh-pages-lectures/LectureSchedule.md

LECTURE_SUPPORT := coursefuns.R 4mblfuns.R 4mbl_metadata.tex \
	lecturestyle.tex coursemacros.tex LectureSchedule.csv

%.tex: %.Rnw $(LECTURE_SUPPORT)
	Rscript -e "library(knitr); knit('$*.Rnw')"
%.pdf: %.tex $(LECTURE_SUPPORT)
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
