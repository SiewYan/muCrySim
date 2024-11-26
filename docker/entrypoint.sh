#!/bin/bash

echo setting up dependencies
source /opt/Miux3-installer/local/bin/geant4.sh
mkdir -p /opt/Miux3-installer/docker/run
cp /opt/Miux3-installer/mac/visVRML.mac /opt/Miux3-installer/docker/run
mkdir -p /opt/Miux3-installer/docker/run/data
cd /opt/Miux3-installer/docker/run
echo "musrSim_upgrade $@"
/opt/muCrySim/local/bin/musrSim_upgrade $@
