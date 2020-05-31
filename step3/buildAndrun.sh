#!/bin/bash
imageNameS='res/http-server'
containerNameS='res-static'
imageNameD='res/http-dynamic-app'
containerNameD='res-dyn'
imageName='res/apache-reverse-proxy'
containerName='res-rp'

docker build  -t $imageName .

if [ -n $(docker ps -aq --filter "name=${containerName}") ]
then
  echo "suppression du container existant"
  docker rm $(docker stop $(docker ps -aq --filter "name=${containerName}"))
fi

#docker kill $containerNameS
#docker kill $containerNameD

#docker run -d --name $containerNameS $imageNameS
#docker run -d --name $containerNameD $imageNameD

ipS=$(docker inspect -f '{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}' $containerNameS)
ipD=$(docker inspect -f '{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}' $containerNameD)



docker run -d -p 8080:80 --name $containerName $imageName -e STATIC_APP=$ipS -e DYNAMIC_APP=$ipD

echo "# opening browser..."
ip=$(docker inspect -f '{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}' $containerName)
sensible-browser $ip:$port
