ARG BASE_CONTAINER=siewyanhoh/geant4:10.7.3.2
FROM $BASE_CONTAINER
LABEL maintainer="Siewyan Hoh <hohsiewyan@sjtu.edu.cn>"

ENV DEBIAN_FRONTEND=noninteractive
ENV LANG=C.UTF-8
SHELL ["/bin/bash", "-c"]

# bring in necessary packages, for some reason bashrc could not be source
USER root

# use id_rsa for git checkout
RUN --mount=type=secret,id=id_rsa \
    mkdir -p /root/.ssh && \
    cp /run/secrets/id_rsa /root/.ssh/id_rsa && \
    chmod 600 /root/.ssh/id_rsa && \
    ssh-keyscan -H github.com >> /root/.ssh/known_hosts

# checkout Miux3 installer, install Geant4
RUN cd /opt && \
    export PATH=/opt/Miux3-installer/local/bin/:$PATH && \
    git clone git@github.com:SiewYan/muCrySim.git && \
    cd muCrySim && \
    sed -i 's#"/home/shoh/Works/muography/muCrySim/musrSim-upgrade-public/cryData"#"/opt/muCrySim/musrSim-upgrade-public/cryData"#g' \
    musrSim-upgrade-public/src/musrPrimaryGeneratorAction.cc && \
    source setup.sh

WORKDIR /opt/muCrySim
    
ENTRYPOINT ["/opt/muCrySim/docker/build/entrypoint.sh"]
