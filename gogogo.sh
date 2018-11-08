#!/bin/bash

export IMAGE="bad_habbit"
export CONTAINER="inception"
export VERSION="latest"
export TAG="$IMAGE:$VERSION"

export MOUNT="type=bind,source=$(pwd)/db_data,target=/code/db_data"

docker build -t "$TAG" .

docker container stop "$CONTAINER"
docker container rm -f "$CONTAINER"

docker run -d \
  -it \
  --privileged \
  --name "$CONTAINER" \
  --mount "$MOUNT" \
  bad_habbit:latest

docker exec -it $CONTAINER sh
