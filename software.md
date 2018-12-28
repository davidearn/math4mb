# SOFTWARE

There are several software packages that you must have on your laptop for this course.
* LaTeX
* R (and the RStudio GUI for R)
* XPPAUT
* Emacs
* A spell-checker that understands LaTeX
You can find the Windows and OS X versions of the packages collected at http://ms.mcmaster.ca/math4mb3.

### Learning R

There will a very brief introduction to R in class.  You are strongly
encouraged to use [DataCamp](https://www.datacamp.com/home) to learn R
more systematically.  Math 4MB is registered with
[DataCamp](https://www.datacamp.com/home) so, during the course, you
are free to explore all their instructional resources without having
to pay a fee.

### A note about running workstation software remotely for Math & Stats graduate students

If you don't have the above applications installed on your laptop or home computer, you can connect to your desktop linux workstation and run them remotely.  This is much easier if you have a Mac or linux computer, but it can still be done for Windows computers.  See [Running Server and Workstation Applications Remotely](http://www.math.mcmaster.ca/mathcomputing/software/?page=running_apps_remotely) on the [Math & Stats Computing Resources web site](http://www.math.mcmaster.ca/mathcomputing/).

# XPPAUT for numerical analysis of dynamical systems

XPPAUT is a powerful program for exploration and bifurcation analysis of dynamical systems.  It is already installed on all of the linux workstations in the math department (which you can login to remotely , as well as from the console).  More importantly, it is open-source free software, which can be downloaded and installed on any computer.

There are many online resources available for XPPAUT:
* [XPPAUT home page](http://www.math.pitt.edu/~bard/xpp/xpp.html) (where you can download the source code and/or pre-compiled executables)
* Bard Ermentrout's [book on XPPAUT](https://www.amazon.ca/exec/obidos/ASIN/0898715067/): <cite>Erme02</cite>
* Bard Ermentrout's [XPPAUT scholarpedia page](http://www.scholarpedia.org/article/XPPAUT)
* [XPP online help](http://www.math.pitt.edu/~bard/xpp/help/xpphelp.html)
* [Emacs xpp-mode](emacs_xpp-mode.md)

See [Using XPPAUT on a Mac](using_XPPAUT_on_a_mac.md) for help with installing and using XPPAUT under OS X.

Note that XPPAUT does not incorporate the latest version of AUTO, which continues to be developed on its own.  However, AUTO is much harder to use directly than via XPPAUT.
If you do want to use AUTO directly then you can find the latest version to download via the main [AUTO web page](http://cmvl.cs.concordia.ca/auto/).

XPPAUT has limited graphical capabilities, but it is always possible to save output data to a file and use R to create professional graphics.

## Installation & Configuration Notes for XPP

### Windows
* XPPAUT uses X11 graphics which are not native to Windows
** I recommend MobXterm Personal Edition (which is free): http://mobaxterm.mobatek.net/download.html
* Note that XPP expects you to copy the folder xppall from the xppwin.zip file to C:\.
* Some people have had trouble when browsing to a directory in XPP, particularly going up by clicking "..".  I've created an alternate xpp.bat file which you can download to your desktop and use to run xpp; it will cause xpp to use the folder C:\xppall as the default starting location.  You should copy any new .ode files to this folder if you find that browsing up causes xpp to hang.

### Mac OS X
* create a folder in /Applications called XPP
* copy the contents of the XPP disk image to that folder
* run xpp like so 
** open Applications -> Utilities -> Terminal and run "/Applications/xpp/bin/xppaut filename.ode"
* ... or ...
** click command-space and enter xppaut

### Testing your installation of XPPAUT

After installing XPPAUT, you should be able to explore the SIR model using [[Media:SIR.ode|this XPPAUT sample .ode file]].  To get started put SIR.ode in the folder where you want to work and (assuming you're working from the command line) type
```
  xppaut SIR.ode
```
then click the _phaseflow_ button and hit `RETURN`.  You should then see a sensible phase portrait.  If you're not working from the command line then start XPPAUT and load `SIR.ode`.

# R

[R](http://www.r-project.org) is an open-source programming language that you can download and install on any computer (it is installed already on all the grad student workstations in the math department).  Installing R gives you the language interpreter and a simple interactive shell.

[RStudio](https://www.rstudio.com/products/rstudio/) is an integrated development environment (IDE) for R. It includes a console, syntax-highlighting editor that supports direct code execution, as well as tools for plotting, history, debugging and workspace management.

# LaTeX

The standard system for mathematical typesetting.  You must use it for your assignments, final project and presentations.   

There are several distributions of TeX but [TeXLive](https://www.tug.org/texlive/) has the advantage of having both Windows and OS X versions and including good TeX/LaTeX editors (TeX is a typesetting program and does not itself include an editor).

## Installation & Configuration Notes for LaTeX

### Windows
* the installation can easily take 30 to 60 minutes
* just download and run the '''install-tl.exe''' file

### OS X
* [https://www.tug.org/mactex/ MacTeX] is a bundle of TeXLive plus TeXShop (a very good editor) and a number of tools.

# Emacs
Emacs is a very powerful editor and can be used for - among other things - R, LaTeX. The learning curve is a little bit steep, but the payoff comes in efficiency.  Use is optional but encouraged.

## Installation & Configuration Notes for Emacs

### Windows
* make sure to run bin/addpm once in order to configure emacs and create an icon under the Start menu

### OS X
Aquamacs (http://aquamacs.org) is a good graphical version of Emacs for OS X, but you can just also run the command ```emacs``` from a Terminal or XQuartz window.

# Spell-checkers and word counters that understand LaTeX

There are a number of [spell-checkers that understand LaTeX](http://en.wikibooks.org/wiki/LaTeX/Tips_and_Tricks#Spell-checking_and_Word_Counting), for example:
* ispell
* aspell
* hunspell
All of these run on Macs via the Terminal.

The unix wc command can be used to count words in a plain text file.  To use it, you first need to remove the TeX macros from your file.  You can then pipe the output into wc.  For example, from the terminal window on a Mac you can type
```
  detex filename | wc
```
where you need to insert the _filename_ of the file in question.

If you have a Mac, the `texcount` command is much more helpful than the above.  The command line syntax is
```
  texcount filename
```
after which helpful information is spewed on your screen.

# Tools for online collaboration on documents and code

[GitHub](https://github.com/)
* collaboration on anything, with superb version control

[Dropbox](https://www.dropbox.com/)
* very simple and convenient, but less-than-superb version control


[Main page for this course](.)
