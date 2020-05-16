#!/bin/bash
docker build -t res/http-server .
docker run --name res-static -d res/http-server