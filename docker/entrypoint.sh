#!/bin/bash

echo setting up dependencies
source /opt/Miux3-installer/local/bin/geant4.sh
mkdir -p /opt/muCrySim/docker/run
cp /opt/muCrySim/mac/visVRML.mac /opt/muCrySim/docker/run
mkdir -p /opt/muCrySim/docker/run/data
cd /opt/muCrySim/docker/run
echo "musrSim_upgrade $@"
/opt/muCrySim/local/bin/musrSim_upgrade $@
