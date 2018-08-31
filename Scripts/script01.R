#'      Course on analysing spatial point patterns with spatstat
#'                     Melbourne, September 2018
#' 
#'                   Lecturer's R script 
#'                  Session 1: Introduction
#' 
#'  Copyright (c) Adrian Baddeley, Ege Rubak, Rolf Turner and Tilman Davies 2018
#' 
library(spatstat)
#' example of a point pattern
plot(bei)
#' [Discuss purposes of analysis]
#' what is 'bei'
bei
class(bei)
#' bei is an object of class 'ppp' (planar point pattern)
plot(bei)
#' plot is a 'generic' R function which does something sensible for any data.
#' For an object X of class 'ppp',
#' the command plot(X) is 'dispatched' as plot.ppp(X)
help(plot.ppp)
plot(bei, cols="blue")
plot(bei, chars=".")
#' web style help display - recommended in base R, not needed in Rstudio
help.start()
#' access help
help(plot.ppp)
#' Read The Help Files!
help(bei)
#' interactive plot
library(tkrplot)
library(rpanel)
iplot(bei)

#' Make your own point pattern
X <- clickppp()
plot(X)
#' Read data from file
#'      (navigate folders using getwd, setwd)
xy <- read.table("Data/phones.txt", header=TRUE)
names(xy)
str(xy)
head(xy)
edit(xy)
Phones <- ppp(xy$x, xy$y, c(0, 20), c(0, 10))
Phones
plot(Phones)

#' A point pattern has a 'window'
Window(bei)
W <- Window(bei)
class(W)
plot(chorley)
Window(chorley)
#' owin objects can be created & manipulated
square(2)

#' basic analysis of a point pattern
summary(bei)
#' dispatched to summary.ppp
intensity(bei)
#' [Discuss concept of intensity; dimensions]



