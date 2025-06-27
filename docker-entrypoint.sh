#!/bin/bash

# Detect the GID of the mounted docker.sock and create group dynamically
DOCKER_GID=$(stat -c '%g' /var/run/docker.sock)
groupadd -g "$DOCKER_GID" docker || true
usermod -aG docker root

exec "$@"
