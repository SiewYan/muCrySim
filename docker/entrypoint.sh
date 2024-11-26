#!/bin/bash

echo setting up dependencies
source /opt/Miux3-installer/local/bin/geant4.sh
mkdir -p run
cp /mac/visVRML.mac run
mkdir -p run/data
cd run
echo "musrSim_upgrade $@"
/opt/muCrySim/local/bin/musrSim_upgrade $@
