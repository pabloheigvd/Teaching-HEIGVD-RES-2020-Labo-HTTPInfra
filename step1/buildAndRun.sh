#!/bin/bash

imageName='res/http-server'
containerName='res-static'

docker build -t $imageName .

if [ -n "$(docker ps -aq --filter "name=${containerName}")" ]
then
  echo "suppression du container existant"
  docker rm $(docker stop $(docker ps -aq --filter "name=${containerName}"))
fi
echo "démarrage du ouveau container"
docker run --name $containerName -d $imageName
