#!/bin/bash

# il est requis d'avoir lancé les container res-static et res-dyn

imageName='res/apache-reverse-proxy'

containerName='res-rp'
staticContainerName='res-static'
dynamicContainerName='res-dyn'

docker build  -t $imageName .

if [ -n "$(docker ps -aq --filter "name=${containerName}")" ]
then
  echo "suppression du container existant"
  docker rm $(docker stop $(docker ps -aq --filter "name=${containerName}"))
fi

ip_Static=$(docker inspect -f '{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}' $staticContainerName)
ip_Dynamic=$(docker inspect -f '{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}' $dynamicContainerName)

docker run -d -e HTTP_STATIC=${ip_Static}:80 -e HTTP_DYNAMIQUE=${ip_Dynamic}:3000 -p 8080:80 --name $containerName $imageName

sensible-browser "http://sacha.site.com:8080/" -d
sensible-browser "http://sacha.site.com:8080/persons/" -d
