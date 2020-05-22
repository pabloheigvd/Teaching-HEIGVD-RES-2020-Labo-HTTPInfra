#!/bin/bash

imageName='res/http-server'
containerName='res-static'

docker build -t $imageName .
docker run --name $containerName -d $imageName
