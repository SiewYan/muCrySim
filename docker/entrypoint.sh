#!/bin/bash

echo setting up dependencies
source /opt/Miux3-installer/local/bin/geant4.sh
mkdir -p docker/run
cp /mac/visVRML.mac docker/run
mkdir -p docker/run/data
cd run
echo "musrSim_upgrade $@"
/opt/muCrySim/local/bin/musrSim_upgrade $@
