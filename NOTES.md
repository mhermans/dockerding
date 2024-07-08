# TODO

* [ ] bekijk werking `renv`, misschien betere oplossing om per project versioned R-libraries te bepalen?
* [ ] maak een aparte image met de system libraries, waar R-images op gebaseerd worden, met system libraries versioned en niet-versioned.
* [ ] maak een versioned versie aan, met ook de system libraries versioned
* [ ] na opkuist van rbleeding en rversioned, push naar docker hub
* [ ] probeer op Diskstation image via docker hub op te starten



# Versioned and mostly modularized R environments

- **mhermans/rversioned**: base image with R, tidyverse and common R packages versioned
- **mhermans/rspatial**: base image + geo/gis R-packages & required libraries such as GDAL
- **mhermans/rnetwork**: base image + R network analysis libraries (+ bindings to mapequation)
- **mhermans/rstats**: base image + various regression, modeling, stats packages


quid R + Python + reticulate + Jupyter + Rstudio image?

quid blogdown docker image met packages om posts steeds hetzelfde te hergenereren?

# Docker/Rstudio combo issues

* Rstudio does not keep track of projects (open project)
* Git push/pull ok over HTTP, maar geen SSH?
* Docker images starten zonder internetverbinding: 
    docker: Error response from daemon: open /etc/resolv.conf: no such file or directory.   

# Docker setup

In folder wiht `Dockerfile`:

    docker build -t mhermans/rgistest:1.0.1 --file Dockerfile .
    docker build -t mhermans/rversioned:0.1.1 --file Dockerfile-rversioned-0.1.1 .
    docker build -t mhermans/rlatest --no-cache --file Dockerfile . 2>&1 | tee log.txt 
    sudo docker build -t mhermans/rbleeding --no-cache --file Dockerfile . 2>&1 | tee log.txt

List available images


Run image (port required for Rstudio):

    docker run -v /home/mhermans/projects/hiking_vis/:/home/rstudio/hiking_vis -p 8787:8787 mhermans/rgistest

Open localhost:8787, rstudio/rstudio login

List (running) containers

    docker images

Run interactive shell 
   
    docker run -i -t mhermans/rgistest /bin/bash

Docker resource use

    docker stats containerid

Stop container

    docker stop container_id 

login to Dockerhub

docker login --username=yourhubusername --password=yourpassword --email=youremail@company.com

password is stored in config.json (but hashed)


List orphaned volumes

	docker volume ls -qf dangling=true

Delete orphaned volumes
	
	docker volume rm $(docker volume ls -qf dangling=true)

Docker disk usage

    docker system df

Clean everything

    docker system prune

... or individual aspects

    docker images prune

	
# R docker envirnonment


docker run --rm -ti -d -p 8787:8787 -v $HOME/var/data:/home/rstudio/data -v $HOME/projects/:/home/rstudio/projects/ rocker/rstudio


Docker run flags

    -d daemon mode
    -e environment variable. Voor Rstudie: PASSWORD=XXX ROOT=true
    -v map volumes external_path:internal_path
    -p map port external_port:internal_port
