#!/usr/bin/env bash

CONTAINER_NAME="dante"
FULL_CONTAINER_NAME="$(docker ps --filter name=$CONTAINER_NAME --format '{{ .Names }}')"

read -p 'Proxy username: ' USERNAME
read -sp 'Proxy password: ' PASSWORD

docker exec "$FULL_CONTAINER_NAME" sh -c "echo -e '$PASSWORD\n$PASSWORD\n' | adduser $USERNAME"
docker commit "$FULL_CONTAINER_NAME"
