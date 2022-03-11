#!/usr/bin/env bash

# environment already has docker and kubernetes installed

sudo yum install python3 python3-pip

sudo ln -s /usr/bin/pip3 /usr/bin/pip

python3 -m venv ~/.devops

source ~/.devops/bin/activate

make install

# https://github.com/hadolint/hadolint/releases/tag/v2.8.0

sudo wget -O /bin/hadolint https://github.com/hadolint/hadolint/releases/download/v2.8.0/hadolint-Linux-x86_64

sudo chmod +x /bin/hadolint

# k8s credentials setup
mkdir -p $HOME/.kube
yes | sudo cp -i -f /etc/kubernetes/admin.conf $HOME/.kube/config
sudo chown $(id -u):$(id -g) $HOME/.kube/config

