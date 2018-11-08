#!/bin/bash

export IMAGE="bad_habbit"
export CONTAINER="inception"
export VERSION="latest"
export TAG="$DOCKER_ID_USER/$IMAGE:$VERSION"

docker build -t "$TAG" .
docker push "$TAG"


docker container stop "$CONTAINER"
docker container rm -f "$CONTAINER"


export MOUNT="type=bind,source=$(pwd)/db_data,target=/code/db_data"
docker run -d \
  -it \
  --privileged \
  --name "$CONTAINER" \
  --mount "$MOUNT" \
  bad_habbit:latest

docker exec -it $CONTAINER sh
