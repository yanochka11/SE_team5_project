#!/bin/bash

# python3 main.py $1 $2 $3

IMAGE_NAME="fse_team5_image"
IMAGE_TAG="latest"
CONTAINER_NAME="fse_team5_container"

docker run -it \
    --log-driver=none \
    --name "${CONTAINER_NAME}" \
    "${IMAGE_NAME}:${IMAGE_TAG}" \
    /bin/bash
