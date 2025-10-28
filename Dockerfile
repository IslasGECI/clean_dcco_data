FROM islasgeci/base:1.0.0

RUN R -e "devtools::install_github('IslasGECI/calling_rate_r')"
RUN R -e "devtools::install_github('IslasGECI/testtools')"

COPY . /workdir
