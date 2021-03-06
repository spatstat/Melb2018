#'      Course on analysing spatial point patterns with spatstat
#'                     Melbourne, September 2018
#' 
#'                   Lecturer's R script 
#'                  Session 7: Envelopes and Monte Carlo tests
#' 
#'  Copyright (c) Adrian Baddeley, Ege Rubak, Rolf Turner and Tilman Davies 2018
#' 
library(spatstat)

set.seed(42)
inde <- rpoispp(100)
regu <- rSSI(0.09, 70)
clus <- rMatClust(30, 0.05, 4)

plot(Kest(clus), cbind(iso,theo) ~ r, lwd=2)
plot(Kest(rpoispp(ex=clus)), iso ~ r, add=TRUE)
for(i in 1:10) plot(Kest(rpoispp(ex=clus)), iso ~ r, add=TRUE)

plot(envelope(clus, Kest, nsim=19))

pats <- rpoispp(ex=clus, nsim=19)
pats[[20]] <- clus
plot(pats, main.panel="", pch=3)

clarkevans(clus)
clarkevans(clus, correction="D")
ce <- sapply(pats, clarkevans, correction="D")
mean(ce[20] >= ce)

plot(envelope(clus, Kest, nsim=39))

plot(envelope(clus, Lest, nsim=39))

plot(envelope(clus, Lest, nsim=19, global=TRUE))

mad.test(clus, Lest, nsim=19)

dclf.test(clus, Lest, nsim=19)

#' a better test 
bits.test(clus, Lest, nsim=19)

#' one-sided test
bits.test(clus, Lest, nsim=19, alternative="greater")


