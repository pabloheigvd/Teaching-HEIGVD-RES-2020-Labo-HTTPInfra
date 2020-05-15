./build2.sh

imageName="res/express_coinflip"
runName="res-labo4-step2"
port=3000

# donne un nom a l'image depuis le repertoire courant
echo "# running image..."
docker run -d -p $port --name $runName $imageName

echo "# opening browser..."
ip=$(docker inspect -f '{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}' $runName)
sensible-browser $ip:$port
