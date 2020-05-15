#!/bin/bash

# constantes
imageName="res/reverse_proxy"
runName="res-labo4-step3"
port=3000

echo "# stopping any running image of name \"$runName\"..."
# stoppe puis enleve une image tournante de nom runName
docker stop $runName && docker rm $runName

# build image
echo "# building image..."
docker build -t $imageName . && echo "# running image..." &&
docker run -p -d $port --name $runName $imageName


#echo "# opening browser..."
ip=$(docker inspect -f '{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}' $runName)
sensible-browser $ip:$port
