#!/bin/sh

set -ex

USERNAME="${USERNAME:-$(id -nu)}"
USERGROUP="${USERGROUP:-$(id -ng)}"
USER_UID="${USER_UID:-$(id -u)}"
USER_GID="${USER_GID:-$(id -g)}"

docker build \
    --build-arg USERNAME="$USERNAME" \
    --build-arg USERGROUP="$USERGROUP" \
    --build-arg USER_UID="$USER_UID" \
    --build-arg USER_GID="$USER_GID" \
    -t geany-in-docker \
    --file Dockerfile-alpine \
    .
