# General R image with tidyverse plus frequently used packages

FROM rocker/tidyverse

MAINTAINER "Maarten Hermans" maarten@mhermans.net

RUN apt-get update \
   && apt-get install -y  --no-install-recommends \
     libimage-exiftool-perl \
     libgdal-dev \
     libproj-dev \
     libgeos-dev \
     libmagick++-dev \
     libpoppler-cpp-dev \
     libudunits2-dev \
     #udunits2 \

     # required for tmap -> V8Z
     libv8-3.14-dev \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/ \
  && rm -rf /tmp/downloaded_packages/ /tmp/*.rds

RUN install2.r --error --deps TRUE \
    rgdal \
    ggrepel \
    directlabels \
    wesanderson \
    countrycode \
    ggthemes \
    openxlsx \
    futile.logger \
    fst \
    #tmap \
    &&  rm -rf /tmp/downloaded_packages/

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
