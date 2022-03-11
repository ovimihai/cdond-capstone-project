#!/usr/bin/env bash

# This tags and uploads an image to Docker Hub

# Step 1:
# This is your Docker ID/path
# dockerpath=<>
export dockerpath="ovimihai/cdond-ml-microservice"

export app_pod="cdond-ml-microservice"

# Step 2
# Run the Docker Hub container with kubernetes
# kubectl delete pod $app_pod || echo "Not present"
kubectl run $app_pod --image=$dockerpath --port=80 --hostport=8000

# Step 3:
# List kubernetes pods
kubectl get pods

# Step 4:
# Forward the container port to a host
# done in step 2
