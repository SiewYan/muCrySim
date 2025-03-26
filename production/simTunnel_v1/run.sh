#!/bin/bash

CWD=$(pwd)

source /cvmfs/sft.cern.ch/lcg/views/LCG_101/x86_64-centos7-gcc11-opt/setup.sh

cd $CWD

MAC=$1
NAME=$2
PROCESS=$3

echo "/lustre/collider/siew/muography/muCrySim/local/bin/musrSim_upgrade $MAC $NAME $PROCESS"
/lustre/collider/siew/muography/muCrySim/local/bin/musrSim_upgrade $MAC $NAME $PROCESS

echo "DONE"
