FROM rocker/tidyverse:latest
WORKDIR /workdir

RUN Rscript -e "install.packages(c('covr', 'DT', 'htmltools', 'styler'), repos='http://cran.rstudio.com')"

COPY . /workdir
