ARG BASE_CONTAINER=ubuntu:jammy
FROM $BASE_CONTAINER
LABEL maintainer="Siewyan Hoh <hohsiewyan@sjtu.edu.cn>"

ENV DEBIAN_FRONTEND=noninteractive
ENV LANG=C.UTF-8

USER root
RUN apt-get update -y && \
    apt-get install --no-install-recommends -y binutils cmake g++ gcc git ninja-build curl python3 ssh ca-certificates && \
    apt-get install --no-install-recommends -y libxerces-c-dev libexpat1-dev libcoin-dev libsoqt-dev libmotif-dev && \
    apt-get clean && rm -rf /var/lib/apt/lists/*

WORKDIR /root

RUN --mount=type=secret,id=id_rsa \
    mkdir -p /root/.ssh && \
    cp /run/secrets/id_rsa /root/.ssh/id_rsa && \
    chmod 600 /root/.ssh/id_rsa && \
    ssh-keyscan -H github.com >> /root/.ssh/known_hosts

RUN cd /opt && \
    touch /root/.bashrc && \
    git clone git@github.com:TDLI-Muon-Physics-Group/Miux3-installer.git && \
    cd Miux3-installer && \
    sed -i 's/INSTALL_G4BL="1"/INSTALL_G4BL="0"/g' install.sh && \
    sed -i 's/INSTALL_ROOT="1"/INSTALL_ROOT="0"/g' install.sh && \
    sed -i 's/Geant4PackageCache.cmake/Geant4PackageCache.cmake.orig/g' install.sh && \
    ./install.sh

RUN rm -rf /opt/Miux3-installer/clhep-* && \
    rm -rf /opt/Miux3-installer/geant4-*

WORKDIR /opt/Miux3-installer

# Create an entrypoint script
RUN echo '#!/bin/bash\nsource /opt/Miux3-installer/local/bin/geant4.sh\nexec "$@"' > /entrypoint.sh && chmod +x /entrypoint.sh

# Set the entrypoint
ENTRYPOINT ["/entrypoint.sh"]