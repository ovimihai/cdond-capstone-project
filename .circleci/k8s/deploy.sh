#!/usr/bin/env bash


CURRENT_DIR=$(dirname $(realpath $0 ))

date

kubectl set image deployment/prediction-app-web prediction-app=ovimihai/cdond-ml-microservice:${CIRCLE_BRANCH}

