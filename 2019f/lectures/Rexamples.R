###############################
## Math 4MB3/6MB3 Intro to R ##
###############################

## some arithmetic
2 + 2
pi
2^8
log(sin(exp(5^(3*pi/7))))

## create a vector
x <- c(0.1, 2, 3.1, 5.8)

## display the vector
x

## vector arithmetic
2*x
x^2
x-1
exp(x)

## a vector containing the first 10 natural numbers
y <- 1:10
y

## a vector containing 15 points between 0 and 1
x <- seq(0,1,length=15)
x

## 3rd element of x
x[3]

## elements 2,3,4 of x
x[2:4]

## all but the first element of x
x[-1]

## all but the first and 5th elements of x
x[-c(1,5)]

## plot the function x^2
plot(x,x^2)

## get a little fancier
plot(x, x^2, pch=21, bg="red", type="b",
     main="Beautiful Plot",
     ylab=expression(x^2))
## add some more to the plot
points(x, x^3, pch=21, bg="green")
lines(x, x, col="blue", lty="dotted", lwd=2)
points(x, sin(2*pi*x), type="l", col="grey", lwd="10")
abline(h=0.5, lty="dashed")
abline(v=0.8, col="yellow")
abline(a=0.2,b=1, col="cyan")
text(x=0.8, y=0.1, "R is FUN!", font=4, col="magenta")

###############################################
## Plot SIR solution curve in SI phase plane ##
###############################################

## define the function I(S) derived in class:
IofS <- function(Si,Ii,R0=2,S) { 
  ## Si,Ii are initial conditions
  ## R0 is reproduction number, not initial removed!
  return(Ii - (S-Si) + (1/R0)*log(S/Si))
}

## set basic reproduction number:
R0 <- 4
## set initial conditions:
Ii <- 0.0001
Si <- 1-Ii
## choose values of S at which to evaluate the function I(S):
Svals <- seq(0,Si,length=100)
## plot I(S):
mycol <- "red"
plot(Svals,IofS(Si,Ii,R0,Svals), typ="l", lwd=2, col=mycol, 
     xlab="S", ylab="I", bty="L", xaxs="i", yaxs="i",
     xlim=c(0,1),ylim=c(0,1))

########################################################
## Make the graph shown in slide 53 of 2017 Lecture 4 ##
## (from HSD, Figure 11.2)  [images/fig11_2.pdf]      ##
########################################################

## CHOOSE GRAPHICS DEVICE
## To try things out in the R console, don't uncomment any of the following.
## For .pdf output, uncomment this line:
## pdf("SIRppLikeHSDfig11_2.pdf")  # change graphics output device to pdf file
## For .tex output, uncomment this line:
## if tikzDevice is not already installed, you must install it:
##    install.packages("tikzDevice")
## library("tikzDevice")
## tikz("SIRppLikeHSDfig11_2.tex",standAlone=TRUE,width=6,height=6)

## MAKE THE PLOT:

## alter margins:
mar.orig <- par("mar")
names(mar.orig) <- c("bottom", "left", "top", "right")
mymar <- mar.orig
mymar["left"] <- mymar["left"] * 0.5
mymar["right"] <- mymar["right"]*0.25
mymar["top"] <- mymar["top"]*0.15
mymar["bottom"] <- mymar["bottom"]*0.5
par(mar=mymar)

## choose colour of solution curves
mycol <- "black"
## choose character expansion factor for text
mycex <- 2.5

## first make the box with no annotation or curves
plot(x=0,y=0,type="n", # don't actually plot anything
     xlim=c(0,1), ylim=c(0,0.5), # axis limits
     xaxp=c(-1,2,1), yaxp=c(-1,2,1), # no axis ticks
     ann=FALSE, # no axis annotation (i.e., no title or axis labels)
     xaxs="i",yaxs="i", # no extra space outside coordinate limits
     las=1 # axis label style: always horizontal
     )

## put the axis labels where we want them
mtext("S", side=1, adj=1, line=1, font=3, cex=mycex) # col="darkgreen", 
mtext("I", side=2, at=0.45, line=1, col=mycol, font=3, las=1, cex=mycex)

## set parameter value
R0 <- 4 # basic reproduction number

## draw biological boundary
lines(x=c(1,0.5),y=c(0,0.5),col="grey",lwd=3,lty="dotted")

## draw vertical line at S=1/R0
abline(v=1/R0, lty="dashed", col="darkgrey", lwd=4)
## add annotation
text(x=1/R0, y=0.45, pos=4, col="black", #"darkgrey",
     ####expression(italic(S)==frac(1,italic(R)[0])))
     "$S=\\frac{\\gamma}{\\beta}=\\frac{1}{{\\mathcal R}_0}$", cex=mycex)

## choose set of initial proportions susceptible
Ii <- 1e-4
Sivals <- c(0.5,0.6,0.7,0.85,0.95)
## set resolution of curves we'll draw
nSvals <- 100
## draw solution curve for each Si value
for (Si in Sivals) {
  Svals <- seq(0,Si,length=nSvals)
  lines(Svals,IofS(Si,Ii,R0,Svals),
      lwd=4, col=mycol)
  ## add arrowhead
  deltax <- -0.001
  x0 <- Svals[trunc(nSvals*2/3)] # pick point 2/3 of the way along solution
  x1 <- x0+deltax
  y0 <- IofS(Si,Ii,R0,x0)
  y1 <- IofS(Si,Ii,R0,x1)
  slope <- (y1-y0)/(x1-x0)
  ##arrows(x0,y0,x1,y1, length=0.15, lwd=4)
  library("shape") # for Arrows(), which yields 'stealth' arrowheads
  Arrows(x0,y0,x1,y1, lwd=2, col=mycol)
}
## indicate that the starting points are unstable equilibria
points(x=Sivals, y=rep(Ii,length(Sivals)),
       col=mycol, pch=21, bg="white", xpd=TRUE, cex=1.5, lwd=2)

## indicate that the ending points are stable equilibria
f <- function(s) {(1/R0)*log(s/Si) - (s-Si)}
Sinfvals <- rep(0,length(Sivals)) # S_infinity values
for (i in 1:length(Sivals)) {
  Si <- Sivals[i]
  Sinfvals[i] <- uniroot(f,c(0,0.9*Si))$root
}
points(x=Sinfvals, y=rep(Ii,length(Sivals)),
       col=mycol, pch=21, bg="black", xpd=TRUE, cex=1.5)

## if the graphics device is a file (pdf or tikz), you must close the file
## properly, which is done by "turning the device off":
## dev.off()

## matplot()
## matrix()
## data.frame()

###################################################
## Make our own version of HSD's nullcline plot  ##
## (from HSD, Figure 11.1)  [images/fig11_1.pdf] ##
###################################################

## CHOOSE GRAPHICS DEVICE
## for .pdf output:
##    pdf("SIRnullclineLikeHSDfig11_1.pdf")  # change graphics output device to pdf file
## for .tex output:
## if tikzDevice is not already installed, you must install it:
##    install.packages("tikzDevice")
library("tikzDevice")
tikz("SIRnullclineLikeHSDfig11_1.tex",standAlone=TRUE,width=6,height=6)

## MAKE THE PLOT:

## alter margins:
mar.orig <- par("mar")
names(mar.orig) <- c("bottom", "left", "top", "right")
mymar <- mar.orig
mymar["left"] <- mymar["left"] * 0.5
mymar["right"] <- mymar["right"]*0.25
mymar["top"] <- mymar["top"]*0.15
mymar["bottom"] <- mymar["bottom"]*0.5
par(mar=mymar)

## direction field colour
mycol <- "lightblue"

## choose character expansion factor for text
mycex <- 2.5

## first make the box with no annotation or curves
plot(x=0,y=0,type="n", # don't actually plot anything
     bty="L", # no upper or right box lines
     xlim=c(0,1), ylim=c(0,0.5), # axis limits
     xaxp=c(-1,2,1), yaxp=c(-1,2,1), # no axis ticks
     ann=FALSE, # no axis annotation (i.e., no title or axis labels)
     xaxs="i",yaxs="i", # no extra space outside coordinate limits
     las=1 # axis label style: always horizontal
     )

## put the axis labels where we want them
mtext("S", side=1, adj=1, line=1, font=3, cex=mycex) # col="darkgreen", 
mtext("I", side=2, at=0.45, line=1, font=3, las=1, cex=mycex)

## set parameter value
R0 <- 4 # basic reproduction number

## draw nullcline at S=1/R0
abline(v=1/R0, lwd=4)
## draw nullcline at coordinate axes
lines(x=c(0,1),y=c(0,0), lwd=4,xpd=NA)
lines(x=c(0,0),y=c(0,0.5), lwd=4,xpd=NA)
## draw biological boundary
lines(x=c(1,0.5),y=c(0,0.5),col="grey",lwd=3,lty="dotted")
## add annotation
text(x=1/R0, y=0.45, pos=4, col="black", #"darkgrey",
     ####expression(italic(S)==frac(1,italic(R)[0])))
     "$S=\\frac{\\gamma}{\\beta}=\\frac{1}{{\\mathcal R}_0}$", cex=mycex)

dIdS <- function(S,I,R0){
  return((R0*S*I - I)/(-R0*S*I))
}

## grid of states for direction field
Svals <- seq(0,1,by=0.25/3)[-1]
Ivals <- Svals/2 * 4/5
## draw arrow at each grid point
for (I in Ivals) {
  deltax <- -0.05
  x0 <- Svals
  y0 <- I
  slope <- dIdS(x0,y0,R0)
  x1 <- x0+deltax
  y1 <- y0+slope*deltax
  ##arrows(x0,y0,x1,y1, length=0.15, lwd=4)
  library("shape") # for Arrows(), which yields 'stealth' arrowheads
  Arrows(x0,y0,x1,y1, lwd=2, col=mycol)
  points(x0,rep(y0,length(x0)), col=mycol, pch=16, cex=0.5)
}
## indicate unstable equilibria for Si>1/R0 and stable otherwise
npt <- 16
points(x=seq(1/R0 + (1-(1/R0))*(1/npt),1,length=npt), y=rep(0,npt),
       col=mycol, pch=21, bg="white", xpd=TRUE, cex=1.3, lwd=2)
npt <- 5
points(x=seq(0,1/R0*(npt/(npt+1)),length=npt), y=rep(0,npt),
       col=mycol, pch=21, bg="black", xpd=TRUE, cex=1.3)

dev.off()
