# ############################################################# #
# Most recent stack R + Rstudio + libs + packages               #
# ############################################################# #

FROM rocker/verse:latest
#FROM rocker/tidyverse:4.2.1
#FROM rocker/tidyverse:4.2.1

MAINTAINER "Maarten Hermans" maarten@mhermans.net

RUN apt-get update -qq && apt-get -y --no-install-recommends install \
    # Rust and other deps for gganimate
    cargo \
    libavfilter-dev \

    # voor X11/intrinsic.h missing
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
     #mesa-common-dev \

     # tmap: proj, gdal, geos 
     libudunits2-dev \
     libv8-dev \  
     libproj-dev \
     libgdal-dev \
     libgeos-dev \

     #chromium needed for gtsave() via webshot2
     chromium-browser \

     #fonts
     fonts-roboto \

     #locale
     locales \

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
    #error srvyr?: importeert ontbrekend pacakge?
    #MplusAutomation \
    openxlsx \
    #fst \
    #feather \
    arrow


# quid versioning packages outside of CRAN?
# error datatailor.be site?
#RUN R -e "install.packages('BelgiumMaps.StatBel', repos = 'http://www.datatailor.be/rcube', type = 'source')"

RUN install2.r --error \
    --deps TRUE \
    sf \
    tmap \
    ggalt \
    leaflet \
    eurostat \
    rworldmap

#RUN R -e "remotes::install_github('davidgohel/officedown')"

RUN R -e "remotes::install_github('rstudio/webshot2')"


RUN install2.r --error \
    --deps TRUE \
    gganimate \
    gghighlight \
    ggtext \
    #sjPlot \ # # importeert rstanarm?
    redux \
    storr \
    lavaan \
    flextable \
    gt \
    officer \
    officedown \
    #binsmooth \
    #ggeffects \ 
    labelled \
    vcd \
    vcdExtra \
    systemfonts \
    extrafont

RUN sed -i -e 's/# nl_BE.UTF-8 UTF-8/nl_BE.UTF-8 UTF-8/' /etc/locale.gen && \
    dpkg-reconfigure --frontend=noninteractive locales && \
    update-locale LANG=nl_BE.UTF-8

ENV LANG nl_BE.UTF-8 



# Define enviroment vars through included dotfiles
COPY .Renviron /home/rstudio/.Renviron
COPY .gitconfig /home/rstudio/.gitconfig

# Set the home directory to the rstudio default user ('rstudio'/'rstudio' login)
WORKDIR /home/rstudio/
