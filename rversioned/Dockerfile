# ##################################################################### #
# Fully versioned R container with Rstudio + tidyverse packages + LaTex #
# ##################################################################### #

# Start from versioned Rocker image with R at a specific version, plus tidyverse+Rstudio+Tex
# The tidyverse libraries are versioned at the release date of the specific R version
FROM rocker/verse:3.4.0

MAINTAINER "Maarten Hermans" maarten@mhermans.net

# Specify exact versions for required libraries using apt-get
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

# install the versions library, that can install specific versions of packages
# using the MRAN service https://mran.microsoft.com/
RUN R -e "install.packages(c('versions'))"

# Install additional R-libraries using the versions library
# (multiple lines for convenience)
RUN R -e "library(versions); install.versions(c('ggrepel', 'tmap', 'likert', 'directlabels', 'countrycode'), c('0.6.5', '1.6', '1.3.5', '2017.03.31', '0.19'))"
RUN R -e "library(versions); install.versions(c('survey', 'openxlsx', 'ggthemes', 'futile.logger', 'fst'), c('3.31-5', '4.0.17', '3.4.0', '1.4.3', '0.7.2'))"

# Define enviroment vars through included dotfiles
COPY .Renviron /home/rstudio/.Renviron
COPY .gitconfig /home/rstudio/.gitconfig

# Set the home directory to the rstudio default user ('rstudio'/'rstudio' login)
WORKDIR /home/rstudio/

# build docker image:
# docker build -t mhermans/rversioned .

# run docker image (localhost:8787):
# docker run -d -v $HOME/var/data:/home/rstudio/data -p 8787:8787 mhermans/rversioned
