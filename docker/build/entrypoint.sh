#!/bin/bash

echo setting up dependencies
source /opt/Miux3-installer/local/bin/geant4.sh
cp /opt/muCrySim/mac/visVRML.mac /root
mkdir -p /root/data
cd /root
echo "musrSim_upgrade $@"
/opt/muCrySim/local/bin/musrSim_upgrade $@
