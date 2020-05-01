#!/bin/bash

# TODO Here we will automate our deploiement

# launch http static server
# -v option will bind our directory src to /var/www/html in the container 
# so we dont need to rebuild the container

docker run -p 8008:80 -v $(pwd)/src/html:/var/www/html -d res/http-server
