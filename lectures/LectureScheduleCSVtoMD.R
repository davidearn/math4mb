## convert LectureSchedule.csv into LectureSchedule.md for
## placement on course web site (via gh-pages).
##
## Created:  1 Jan 2018
## Changed:  

fn <- "LectureSchedule.md"

##course.code <- "3a"
course.code <- "4mb"

LectureScheduleTOP <-
  "* To download slides for a lecture, click on the lecture number.
* Slides for a sequence of lectures on the same topic are combined, so you need only the pdf for the final lecture on a given topic.
* Please e-mail the instructor if you find any errors in slides.

## Lecture Schedule
| W | L | Date | Topic | Links/Comments |
|---|---|------|-------|----------------|"

LectureScheduleBOTTOM <-
  "
[Math 4MB/6MB main page](https://davidearn.github.io/math4mb/)"

markdownify <- function(df) {
  with(df,{
    weeknum.string <- ifelse(is.na(weeknum),"",as.character(weeknum))
    filelink.string <- sprintf("[%2.2d](%sl%2.2d_%d.pdf)",lecnum,course.code,lecnum,year)
    date.string <- sprintf("%s %d %s %d",
                 weekdays(as.Date(paste(year,month,day,sep="-")),abbreviate=TRUE),
                 day, month.abb[month], year)
    topic.string <- sub("$\\reals$","$$\\mathbb{R}$$",topic,fixed=TRUE)
    topic.string <- sub("\\\\","<br>",topic.string,fixed=TRUE)
    topic.string <- sub("$\\Rlogo$","![Rlogo](images/Rlogo.png)",topic.string,fixed=TRUE)
    comment.string <- ifelse(is.na(comment),"",comment)
    comment.string <- sub("SadFace","&#9785;",comment.string,fixed=TRUE)
    return(sprintf(
"| %s | %s | %s | %s | %s |",
      weeknum.string,
      filelink.string,
      date.string,
      topic.string,
      comment.string))
  })
}

schedule <- read.csv("LectureSchedule.csv",comm="#",stringsAsFactors=FALSE)

cat(LectureScheduleTOP,
    markdownify(schedule),
    LectureScheduleBOTTOM,
    file=fn,sep="\n")
