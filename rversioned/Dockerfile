# General R image with tidyverse plus frequently used packages

# Start from versioned Rocker image with tidyverse+Rstudio+Tex
FROM rocker/verse:3.4.0

MAINTAINER "Maarten Hermans" maarten@mhermans.net

RUN apt-get update \
   && apt-get install -y  --no-install-recommends \
     libimage-exiftool-perl=9.74-1 \
     libmagick++-dev=8:6.8.9.9-5+deb8u8 \

     # tmap: proj, gdal, geos 
     libproj-dev=4.8.0-5 \
     libgdal-dev=1.10.1+dfsg-8+b3 \
     libgeos-dev=3.4.2-6 \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/ \
  && rm -rf /tmp/downloaded_packages/ /tmp/*.rds

RUN R -e "install.packages(c('versions'))"
RUN R -e "library(versions); install.versions(c('ggrepel', 'tmap', 'likert', 'directlabels', 'countrycode'), c('0.6.5', '1.6', '1.3.5', '2017.03.31', '0.19'))"
RUN R -e "library(versions); install.versions(c('survey', 'openxlsx', 'ggthemes', 'futile.logger', 'fst'), c('3.31-5', '4.0.17', '3.4.0', '1.4.3', '0.7.2'))"

#RUN installGithub.r \
#    michaelhallquist/MplusAutomation \
#    && rm -rf /tmp/downloaded_packages/

COPY .Renviron /home/rstudio/.Renviron
COPY .gitconfig /home/rstudio/.gitconfig

# TODO
# set ENV variables (global of via .Renviron)
# Git global config instellen
# hoe package versions fixen voor reproduceerbaarheid
# Fonts?

WORKDIR /home/rstudio/
