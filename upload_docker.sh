#!/usr/bin/env bash
# This file tags and uploads an image to Docker Hub

# Assumes that an image is built via `run_docker.sh`

# Step 1:
# Create dockerpath
# dockerpath=<your docker ID/path>
dockerpath="ovimihai/cdond-ml-microservice"

# Step 2:  
# Authenticate & tag
echo "Docker ID and Image: $dockerpath"

# Step 3:
# Push image to a docker repository
docker tag cdond-ml-microservice $dockerpath

docker push dockerpath

# https://hub.docker.com/r/ovimihai/cdond-ml-microservice