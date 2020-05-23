#!/bin/bash

imageName='res/apache-reverse-proxy'
containerName='res-rp'

docker build  -t $imageName .

if [ -n $(docker ps -aq --filter "name=${containerName}") ]
then
  echo "suppression du container existant"
  docker rm $(docker stop $(docker ps -aq --filter "name=${containerName}"))
fi

docker run -p 8080:80 --name $containerName $imageName
