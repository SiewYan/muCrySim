#!/bin/bash

IMAGE="test:v1"

# BUILD
docker build --secret id=id_rsa,src=$HOME/.ssh/id_ed25519 -t $IMAGE .
