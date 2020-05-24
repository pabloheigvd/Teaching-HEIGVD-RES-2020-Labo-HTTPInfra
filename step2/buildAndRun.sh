#!/bin/bash

imageName='res/http-dynamic-app'
containerName='res-dyn'

docker build -t $imageName .

if [ -n $(docker ps -aq --filter "name=${containerName}") ]
then
  echo "suppression du container existant"
  docker rm $(docker stop $(docker ps -aq --filter "name=${containerName}"))
fi

docker run -d --name $containerName $imageName
