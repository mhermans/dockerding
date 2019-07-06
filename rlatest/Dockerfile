# ############################################################# #
# Most recent stack R + Rstudio + libs + packages               #
# ############################################################# #

# 
FROM rocker/verse:latest

MAINTAINER "Maarten Hermans" maarten@mhermans.net

RUN apt-get update -qq && apt-get -y --no-install-recommends install \
    # Rust and other deps for gganimate
    cargo \
    libavfilter-dev \

     # JSON processor, for package jqr (used by spatial packages)
     libjq-dev=1.5+dfsg-1.3 \ 
     protobuf-compiler=3.0.0-9 \

     # protocol buffers lib, for package protolite (used by spatial packages)
     libprotobuf-dev=3.0.0-9 \

     # redis / redux / storr
     libhiredis-dev \


     # tmap: proj, gdal, geos 
     libudunits2-dev \
     libv8-3.14-dev \  
     libproj-dev \
     libgdal-dev \
     libgeos-dev \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/ \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/ \
  && rm -rf /tmp/downloaded_packages/ /tmp/*.rds

RUN install2.r --error \
    --deps TRUE \
    devtools \
    janitor \
    assertr \
    futile.logger \
    here \
    caTools \
    ggrepel \
    directlabels \
    cowplot \
    ggthemes \
    hrbrthemes \
    ggridges \
    ggforce \
    likert \
    countrycode \
    survey \
    srvyr \
    MplusAutomation \
    openxlsx \
    fst \
    feather

# quid versioning packages outside of CRAN?
RUN R -e "install.packages('BelgiumMaps.StatBel', repos = 'http://www.datatailor.be/rcube', type = 'source')"

RUN install2.r --error \
    --deps TRUE \
    sf \
    tmap \
    ggalt \
    leaflet \
    eurostat \
    rworldmap

RUN R -e "remotes::install_github('rstudio/gt')"


RUN install2.r --error \
    --deps TRUE \
    gganimate \
    redux \
    storr \
    lavaan \
    flextable \
    officer


# Define enviroment vars through included dotfiles
COPY .Renviron /home/rstudio/.Renviron
COPY .gitconfig /home/rstudio/.gitconfig

# Set the home directory to the rstudio default user ('rstudio'/'rstudio' login)
WORKDIR /home/rstudio/
