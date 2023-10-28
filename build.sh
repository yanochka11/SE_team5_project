#!/bin/bash

# Define variables for the image name and tag
IMAGE_NAME="fse_team5_image"
IMAGE_TAG="latest"

# Build the Docker image
docker build  \
  -f Dockerfile \
  -t "${IMAGE_NAME}:${IMAGE_TAG}" .

# Check if the image was successfully built
if [ $? -eq 0 ]; then
  echo "Docker image '${IMAGE_NAME}:${IMAGE_TAG}' has been built successfully."
else
  echo "Error: Failed to build the Docker image."
fi

