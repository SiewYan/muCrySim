#!/bin/bash

IMAGE="test:v1"

# BUILD
docker build --secret id=id_rsa,src=/Users/shoh/.ssh/id_ed25519 -t test:v1 .

# RUN 
#docker run -it --rm -v $(pwd)/volume:/mnt $IMAGE /bin/bash

## clear cache (images and containers)
# docker system df
# docker container prune -f
# docker image prune -f
# docker builder prune
