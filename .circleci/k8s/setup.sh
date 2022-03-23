#!/usr/bin/env bash


CURRENT_DIR=$(dirname $(realpath $0 ))

date

# https://medium.com/analytics-vidhya/write-kubernetes-manifests-for-python-flask-app-aa9e3bee710b
#kubectl apply -f namespace.yaml

# https://aws.amazon.com/premiumsupport/knowledge-center/eks-kubernetes-services-cluster/

kubectl apply -f ${CURRENT_DIR}/namespace.yaml \
    -f ${CURRENT_DIR}/deployment.yaml

kubectl expose deployment prediction-app-web --type=LoadBalancer --name=prediction-app-loadbalancer-expose

# -f ingress.yaml
# -f lb.yaml
# -f job.yaml \
# -f service.yaml \
# -f clusterip.yaml


#kubectl expose deployment nginx-deployment  --type=LoadBalancer  --name=nginx-service-loadbalancer

date

