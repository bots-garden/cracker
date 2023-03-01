#!/bin/bash
set -o allexport; source .env; set +o allexport

#docker run -p 8080:8080 --env-file=.go.config --rm ${DOCKER_USER}/${IMAGE_NAME}:${IMAGE_TAG}
docker run -p 8080:8080 --env-file=.rust.config --rm ${DOCKER_USER}/${IMAGE_NAME}:${IMAGE_TAG}

#docker run -p 8080:8080 --rm ${DOCKER_USER}/${IMAGE_NAME}:${IMAGE_TAG}
