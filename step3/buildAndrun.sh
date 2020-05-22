#!/bin/bash

imageName='res/apache-reverse-proxy'
containerName='res-rp'

docker build  -t $imageName .
docker run -p 8080:80 --name $containerName $imageName
