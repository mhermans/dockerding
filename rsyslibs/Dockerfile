# ############################################################# #
# Intermediary container with tidyverse + additional required   #
#  system libraries                                             #
# ############################################################# #

FROM rocker/tidyverse:4.2.1

MAINTAINER "Maarten Hermans" maarten@mhermans.net

RUN apt-get update -qq && apt-get -y --no-install-recommends install \
    # Rust and other deps for gganimate
    cargo \
    libavfilter-dev \

    # nodig voor Cairo (X11/intrinsic.h missing)
    libxt-dev \ 

     # voor pdftools
     libpoppler-cpp-dev \

     # JSON processor, for package jqr (used by spatial packages)
     libjq-dev \ 
     protobuf-compiler \

     # protocol buffers lib, for package protolite (used by spatial packages)
     libprotobuf-dev \

     # redis / redux / storr
     libhiredis-dev \

     # voor rgl ?
     libglu1-mesa-dev \

     # onduidelijk waar dit voor nodig was?
     #mesa-common-dev \

     # tmap: proj, gdal, geos 
     libudunits2-dev \
     libv8-dev \  
     libproj-dev \
     libgdal-dev \
     libgeos-dev \

     #chromium needed for gtsave() via webshot2
     #TODO: eerst nog uittesten
     #chromium-browser \

     #fonts
     fonts-roboto-fontface \

     #locale
     locales \

  && apt-get clean \
  && rm -rf /var/lib/apt/lists/ \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/ \
  && rm -rf /tmp/downloaded_packages/ /tmp/*.rds

RUN sed -i -e 's/# nl_BE.UTF-8 UTF-8/nl_BE.UTF-8 UTF-8/' /etc/locale.gen && \
    dpkg-reconfigure --frontend=noninteractive locales && \
    update-locale LANG=nl_BE.UTF-8

ENV LANG nl_BE.UTF-8 

# Define enviroment vars through included dotfiles
# enkel in afgeleide images toevoegen
#COPY .Renviron /home/rstudio/.Renviron
#COPY .gitconfig /home/rstudio/.gitconfig

# Set the home directory to the rstudio default user ('rstudio'/'rstudio' login)
WORKDIR /home/rstudio/
