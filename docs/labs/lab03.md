Lab 3: Intensity dependent on covariate
================

This session covers tools for investigating intensity depending on a covariate.
The lecturer's R script is [available here](https://raw.githubusercontent.com/spatstat/Melb2018/master/Scripts/script03.R) (right click and save).

### Exercise 1

The `bei` dataset gives the locations of trees in a survey area with additional covariate information in a list `bei.extra`.

1.  Assign the elevation covariate to a variable `elev` by typing

    ``` {.r}
    elev <- bei.extra$elev
    ```

2.  Plot the trees on top of an image of the elevation covariate.

3.  Cut the study region into 4 areas according to the value of the terrain elevation, and make a texture plot of the result.

4.  Convert the image from above to a tesselation, count the number of points in each region using `quadratcount`, and plot the quadrat counts.

5.  Estimate the intensity in each of the four regions.

### Exercise 2

Assume that the intensity of trees is a function \(\lambda(u) = \rho(e(u))\) where \(e(u)\) is the terrain elevation at location u.

1.  Compute a nonparametric estimate of the function \(\rho\) and plot it by

    ``` {.r}
    rh <- rhohat(bei, elev)
    plot(rh)
    ```

2.  Compute the predicted intensity based on this estimate of \(\rho\).

3.  Compute a non-parametric estimate by kernel smoothing and compare with the predicted intensity above.

4.  Bonus info: To plot the two intensity estimates next to each other you collect the estimates as a spatial object list (`solist`) and plot the result (the estimates are called `pred` and `ker` below):

    ``` {.r}
    l <- solist(pred, ker)
    plot(l, equal.ribbon = TRUE, main = "", 
         main.panel = c("rhohat prediction", "kernel smoothing"))
    ```

### Exercise 3

Continuing with the dataset `bei` conduct both Berman's Z1 and Z2 tests for dependence on `elev`, and plot the results.
