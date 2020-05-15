#!/bin/bash

docker run -p 8008:80 -v $(pwd)/html:/var/wwww/html -d res/http-server