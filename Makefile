## The Makefile includes instructions on environment setup and lint tests
# Create and activate a virtual environment
# Install dependencies in requirements.txt
# Dockerfile should pass hadolint
# app.py should pass pylint
# (Optional) Build a simple integration test

setup:
	# Create python virtualenv & source it
	# source ~/.devops/bin/activate
	python3 -m venv ~/.devops

install:
	# This should be run from inside a virtualenv
	pip install --upgrade pip &&\
		pip install -r app/requirements.txt

test:
	cd app; python -m pytest tests

lint:
	# See local hadolint install instructions:   https://github.com/hadolint/hadolint
	# This is linter for Dockerfiles
	hadolint Dockerfile
	# This is a linter for Python source code linter: https://www.pylint.org/
	# This should be run from inside a virtualenv
	pylint --disable=R,C,W1203,W1202 app/app.py

docker-build:
	docker build -t cdond-ml-microservice .

docker-push:
	export dockerpath="ovimihai/cdond-ml-microservice"
	echo "Docker ID and Image: $dockerpath"

	docker tag cdond-ml-microservice $dockerpath

	docker push dockerpath

docker-run: docker-build
	docker run -p 8000:80 cdond-ml-microservice

all: install lint test
