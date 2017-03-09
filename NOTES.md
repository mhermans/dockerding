# Docker/Rstudio combo issues

* Rstudio does not keep track of projects (open project)
* Git push/pull ok over HTTP, maar geen SSH?

# Docker setup

In folder wiht `Dockerfile`:

    docker build -t mhermans/rgistest .

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

mercurial
hg clone https://bitbucket.org/mapequation/infomap
make

login to Dockerhub

docker login --username=yourhubusername --password=yourpassword --email=youremail@company.com

password is stored in config.json (but hashed)


List orphaned volumes

	docker volume ls -qf dangling=true

Delete orphaned volumes
	
	docker volume rm $(docker volume ls -qf dangling=true)

	
# R docker envirnonment

futile-logger

docker run --rm -ti -d -p 8787:8787 -v $HOME/var/data:/home/rstudio/data -v $HOME/projects/:/home/rstudio/projects/ rocker/rstudio
