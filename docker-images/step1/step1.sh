#!/bin/bash

./build1.sh

imageName="res/apache_php"
runName="res-labo4-step1"
port=80

# donne un nom a l'image depuis le repertoire courant
echo "# running image..."
docker run -d -p $port --name $runName $imageName

echo "# opening browser..."
ip=$(docker inspect -f '{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}' $runName)
sensible-browser $ip:$port

# some dependency between runBuild1.sh and this shell script because of $port variable
