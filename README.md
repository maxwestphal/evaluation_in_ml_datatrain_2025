
# Evaluating machine learning and artificial intelligence algorithms (Data Train course 2025)

<!-- badges: start -->

<!-- badges: end -->

## Contents

This repository contains course materials from the

<center>

**“Evaluating machine learning and artificial intelligence algorithms”**
</br> [Data Train Course
2025](https://www.bremen-research.de/data-train/courses/course-catalogue/course-details?event_id=45).

</center>

The rendered html slides can be accessed here:
<center>

**<https://maxwestphal.github.io/evaluation_in_ml_datatrain_2025/>**

</center>

Author: [**Max Westphal**](https://www.linkedin.com/in/maxwestphal/)
(<max.westphal@mevis.fraunhofer.de>)

Course instructors:

- Max Westphal
- Werner Brannath
- Tom Splittgerber

## Instructions for Course Participants

### R users

To prepare for the course,

- install R + Rstudio from <https://posit.co/download/rstudio-desktop/>
- clone this repository:
  `git clone https://github.com/maxwestphal/evaluation_in_ml_datatrain_2025.git`
  \[terminal\] (in desired parent directory),
  - alternatively, without Git, you can choose the option “Code” \>
    “Download ZIP” at
    <https://github.com/maxwestphal/evaluation_in_ml_datatrain_2025> and
    unzip the files locally
- open the project “evaluation_in_ml_datatrain_2025.Rproj” in RStudio
- install renv:
  `install.packages(c("yaml", "renv"), dependencies = TRUE)` \[R\]
- activate renv: `renv::activate()` \[R\]
- install packages `renv::install()` \[R\] (confirm if asked to)
- restore dependencies: `renv::restore()` \[R\] (confirm if asked to)

### Python users

…

## License

This work is released under a [CC BY-SA
4.0](https://creativecommons.org/licenses/by-sa/4.0/) license.

## Issues

If you find an error or have suggestions for improvements, please create
a new issue here:

<https://github.com/maxwestphal/evaluation_in_ml_datatrain_2025/issues>

## Reproduction

If you are interested in reproducing the course materials (i.e. train
prediction models and produce the evaluation data), please conduct the
following steps:

- re-produce pre-computed results: `source("scripts/_run.R)` \[R\]
- render the file “slides.qmd”: `quarto::quarto_render()` \[R\]

## R Version Info

``` r
str(R.Version())
```

    ## List of 15
    ##  $ platform      : chr "x86_64-w64-mingw32"
    ##  $ arch          : chr "x86_64"
    ##  $ os            : chr "mingw32"
    ##  $ crt           : chr "ucrt"
    ##  $ system        : chr "x86_64, mingw32"
    ##  $ status        : chr ""
    ##  $ major         : chr "4"
    ##  $ minor         : chr "5.1"
    ##  $ year          : chr "2025"
    ##  $ month         : chr "06"
    ##  $ day           : chr "13"
    ##  $ svn rev       : chr "88306"
    ##  $ language      : chr "R"
    ##  $ version.string: chr "R version 4.5.1 (2025-06-13 ucrt)"
    ##  $ nickname      : chr "Great Square Root"
