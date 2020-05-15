#!/bin/bash

# constantes
imageName="res/express_coinflip"
runName="res-labo4-step2"
port=3000

echo "# stopping any running image of name \"$runName\"..."
# stoppe puis enleve une image tournante de nom runName
docker stop $runName && docker rm $runName

# build image
echo "# building image..."
docker build -t $imageName .
