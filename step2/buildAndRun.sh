#!/bin/bash

docker build -t res/http-dynamic-app .

docker run -d --name res-dyn res/http-dynamic-app