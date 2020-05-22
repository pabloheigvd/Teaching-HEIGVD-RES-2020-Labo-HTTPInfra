#!/bin/bash

imageName='res/http-dynamic-app'
containerName='res-dyn'

docker build -t $imageName .

docker run -d --name $containerName $imageName
