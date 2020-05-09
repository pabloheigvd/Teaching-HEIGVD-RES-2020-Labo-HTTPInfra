#!/bin/bash

# constantes
imageName="res/apache_php"
runName="res-labo4-step1"
port=80

echo "# stopping any running image of name \"$runName\"..."
# stoppe puis enleve une image tournante de nom runName
docker stop $runName && docker rm $runName

# build image
echo "# building image..."
docker build -t $imageName .

# donne un nom a l'image depuis le repertoire courant
echo "# running image..."
docker run -d -p $port --name $runName $imageName

echo "# opening browser..."
ip=$(docker inspect -f '{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}' $runName)
sensible-browser $ip:$port
