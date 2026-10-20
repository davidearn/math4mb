# Course Material for Math 4MB/6MB at McMaster University

- [Course information sheet](handouts/4mbinfo_2018.pdf)
- [Lecture Schedule](lectures/LectureSchedule.md)
- [Math 4MB/6MB main page](https://davidearn.github.io/math4mb/)

## Fall 2026 schedule sources

`lectures/LectureSchedule.csv` is also used by the private lecture sources
through a symbolic link in `../repoprivate/lectures/`. Generate the schedule
from that private directory, where the current lecture PDFs and metadata are
available. Keep `lectures/LectureSchedule.md` synchronized with that generated
schedule. The live website files are maintained separately on the `gh-pages`
branch in the `gh-pages/` checkout; updating these source files does not publish
them.

## Ignore rules

`.gitignore` is a regular tracked file specific to this source repository.
It excludes untracked LaTeX/R build products, caches, generated PDFs and ZIP
archives, backups, the generated README and lecture-schedule HTML files, and
the nested `gh-pages/` website checkout and its lecture publication link.
Already tracked PDFs and `lectures/latexexamples.zip` remain tracked; the
rules do not remove or untrack any existing files. The ignore rules do not
depend on the private repository's `.gitignore`.
