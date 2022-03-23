#!/usr/bin/env bash

export CLUSTER_NAME=eksctl-capstone-cluster


aws cloudformation deploy \
    --template-file cluster.yml \
    --stack-name ${CLUSTER_NAME}


aws cloudformation deploy \
    --template-file node-group.yml \
    --stack-name ${CLUSTER_NAME}-nodegroup-ng-1


aws eks describe-cluster \
    --region us-west-2 \
    --name ${CLUSTER_NAME} \
    --query "cluster.status"


aws eks update-kubeconfig --region us-west-2 --name ${CLUSTER_NAME}


aws eks describe-cluster --name ${CLUSTER_NAME} --query cluster.resourcesVpcConfig.clusterSecurityGroupId

export NS=prices-predict
kubectl config set-context --current --namespace=$NS