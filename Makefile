## The Makefile includes instructions on environment setup and lint tests
# Create and activate a virtual environment
# Install dependencies in requirements.txt
# Dockerfile should pass hadolint
# app.py should pass pylint
# (Optional) Build a simple integration test
DOCKER_IMAGE := "ovimihai/cdond-ml-microservice"


setup:
	# Create python virtualenv & source it
	# source ~/.devops/bin/activate
	python3 -m venv ~/.devops

install:
	# This should be run from inside a virtualenv
	pip3 install --upgrade pip &&\
		pip3 install -r app/requirements.txt

	# Install hadolint
	mkdir -p /tmp/bin
    wget -O /tmp/hadolint https://github.com/hadolint/hadolint/releases/download/v1.16.3/hadolint-Linux-x86_64 \
    && chmod +x /tmp/hadolint

test:
	cd app; python -m pytest tests

lint:
	# See local hadolint install instructions:   https://github.com/hadolint/hadolint
	# This is linter for Dockerfiles
	wget -O /tmp/hadolint https://github.com/hadolint/hadolint/releases/download/v1.16.3/hadolint-Linux-x86_64 \
    	&& chmod +x /tmp/hadolint \
		&& /tmp/hadolint Dockerfile
	# This is a linter for Python source code linter: https://www.pylint.org/
	# This should be run from inside a virtualenv
	pylint --disable=R,C,W1203,W1202,W0621 app/app.py

docker-build:
	docker build -t cdond-ml-microservice .

docker-push:
	echo "Docker ID and Image: ${DOCKER_IMAGE}"

	docker tag cdond-ml-microservice "${DOCKER_IMAGE}"

	docker push "${DOCKER_IMAGE}"

docker-run: docker-build
	docker run -p 8000:80 cdond-ml-microservice

all: install lint test
