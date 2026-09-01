## convert LectureSchedule.csv into LectureSchedule.md for
## placement on course web site (via gh-pages).
##
## Created:  1 Jan 2018
## Changed:  8 Sep 2019 (one 3 hour lecture per week)
##          30 Aug 2024 ('Tentative')
##           9 Aug 2026 (link topic-level decks using the file column)
##          31 Aug 2026 (show recess rows between separate schedule tables)

fn <- "LectureSchedule.md"

##course.code <- "3a"
course.code <- "4mb"
term.code <- "f"

LectureScheduleHEADER <-
  "| Week | Date | Topic | Links/Comments |
|------|------|-------|----------------|"

LectureScheduleTOP <- sprintf(
  "* To download slides for a lecture, click on the lecture week number.
* Slides for a sequence of lectures on the same topic are combined, so you need only the pdf for the final lecture on a given topic.
* Please e-mail the instructor if you find any errors in slides.

## Tentative Lecture Schedule

%s", LectureScheduleHEADER)

LectureScheduleBOTTOM <- sprintf(
  "
[Main page for this course](https://davidearn.github.io/math%s/)",course.code)

markdownify <- function(df, debug=TRUE) {
  with(df,{
    weeknum.string <- ifelse(is.na(weeknum),"",as.character(weeknum))
    source.string <- ifelse(is.na(file), "", trimws(file))
    pdf.string <- sub("[.]Rnw$", ".pdf", source.string)
    filelink.string <- ifelse(nzchar(pdf.string),
      sprintf("[%s](%s)", weeknum.string, pdf.string),
      weeknum.string)
    date.string <- sprintf("%s %d %s %d",
                 weekdays(as.Date(paste(year,month,day,sep="-")),abbreviate=TRUE),
                 day, month.abb[month], year)
    topic.string <- sub("$\\reals$","$$\\mathbb{R}$$",topic,fixed=TRUE)
    topic.string <- sub("\\\\","<br>",topic.string,fixed=TRUE)
    topic.string <- sub("$\\Rlogo$","![Rlogo](images/Rlogo.png)",topic.string,fixed=TRUE)
    comment.string <- ifelse(is.na(comment),"",comment)
    comment.string <- sub("SadFace","&#9785;",comment.string,fixed=TRUE)
    if (debug) {
        message("date.string: ", date.string)
    }
    rows <- sprintf("| %s | %s | %s | %s |",
      filelink.string,
      date.string,
      topic.string,
      comment.string)
    is.recess <- !is.na(lecnum) & lecnum == 0
    rows[is.recess] <- sprintf(
      "\n<p align=\"center\"><strong>%s &mdash; %s</strong></p>\n\n%s",
      topic.string[is.recess],
      comment.string[is.recess],
      LectureScheduleHEADER)
    return(rows)
  })
}

schedule <- read.csv("LectureSchedule.csv",comm="#",stringsAsFactors=FALSE)

stopifnot("file" %in% names(schedule))

cat(LectureScheduleTOP,
    markdownify(schedule),
    LectureScheduleBOTTOM,
    file=fn,sep="\n")
