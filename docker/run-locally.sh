#!/bin/bash
set -o allexport; source .env; set +o allexport

#docker run -p 8080:8080 --env-file=.go.config --rm ${IMAGE_NAME} 
docker run -p 8080:8080 --env-file=.rust.config --rm ${IMAGE_NAME} 
