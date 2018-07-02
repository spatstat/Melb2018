Lab 8: Spacing and distances
================

This session is concerned with summary statistics for spacings and interpoint distances.
The lecturer's R script is [available here](https://raw.githubusercontent.com/spatstat/SSAI2017/master/Scripts/script08.R) (right click and save).

### Exercise 1

For the `swedishpines` data:

1.  Calculate the estimate of the nearest neighbour distance distribution function *G* using `Gest`.

2.  Plot the estimate of *G*(*r*) against *r*.

3.  Plot the estimate of *G*(*r*) against the theoretical (Poisson) value *G*<sub>pois</sub>(*r*)=1 − exp(−*λ**π**r*<sup>2</sup>).

4.  Define Fisher’s variance-stabilising transformation for c.d.f.’s by

    ``` r
    Phi <- function(x) asin(sqrt(x))
    ```

    Plot the *G* function using the formula `Phi(.) ~ Phi(theo)` and interpret it.

### Exercise 2

For the `swedishpines` data:

1.  Calculate the estimate of the nearest neighbour distance distribution function *F* using `Fest`.

2.  Plot the estimate of *F*(*r*) against *r*.

3.  Plot the estimate of *F*(*r*) against the theoretical (Poisson) value *F*<sub>pois</sub>(*r*)=1 − exp(−*λ**π**r*<sup>2</sup>).

4.  Define Fisher’s variance-stabilising transformation for c.d.f.’s by

    ``` r
    Phi <- function(x) asin(sqrt(x))
    ```

    Plot the *F* function using the formula `Phi(.) ~ Phi(theo)` and interpret it.
