
# choose CRAN mirror
options(
  repos=c(
    CRAN='http://cran.rstudio.com/'
  ),
  unzip="unzip"
)

# remaining R packages
install.packages(
  c(
    'nortest',
    'RPostgreSQL'
  ),
  dependencies=TRUE
)
