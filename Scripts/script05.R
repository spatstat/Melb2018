#'      Course on analysing spatial point patterns with spatstat
#'                     Melbourne, September 2018
#' 
#'                   Lecturer's R script 
#'                  Session 5: Marked point patterns
#' 
#'  Copyright (c) Adrian Baddeley, Ege Rubak, Rolf Turner and Tilman Davies 2018
#' 
options(width=130) #' stretch window to widest
library(spatstat)

#' multitype
plot(ants)
plot(ants, cols=2:3)
plot(amacrine, cols=5:6)

#' represented as *marked point pattern* with categorical (factor) marks
View(ants)   # in RStudio, need to say:   utils::View(ants)
head(as.data.frame(ants))
marks(ants)

#'
View(longleaf)
head(as.data.frame(longleaf))
plot(longleaf)

View(finpines)
plot(finpines)

head(as.data.frame(nbfires))

#' multitype
plot(ants, cols=2:3)
plot(split(ants))
split(ants)

plot(urkiola)
plot(split(urkiola))

#' nonparametric intensity estimate
plot(density(split(urkiola)))

plot(relrisk(urkiola, casecontrol=FALSE))
#' relrisk performs automatic bandwidth selection
b <- bw.relrisk(urkiola)
b
plot(b)
plot(b, xlim=c(7,30))
plot(relrisk(urkiola, casecontrol=FALSE, sigma=b))

#' parametric models
ppm(urkiola ~ marks)
ppm(urkiola ~ marks + x)  # 'parallel regression'
ppm(urkiola ~ marks * x) 
coef(ppm(urkiola ~ marks + polynom(x,y,2)))
coef(ppm(urkiola ~ marks * polynom(x,y,2)))

fit <- ppm(urkiola ~ marks * x)
plot(relrisk(fit)) # relrisk.ppm calculates ratio of intensities for each type

#' model selection
fitadd <- ppm(urkiola ~ marks + polynom(x,y,2))
fitgen <- ppm(urkiola ~ marks * polynom(x,y,2))
anova(fitadd, fitgen, test="LR")


step(fitgen)







