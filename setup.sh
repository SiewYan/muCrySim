#!/bin/bash

CWD=$(pwd)
DOMAIN=$(echo $HOSTNAME | awk -F "." '{print $NF}')

if [[ $DOMAIN == "sjtulocal" ]]; then
    echo "source /cvmfs/sft.cern.ch/lcg/views/LCG_101/x86_64-centos7-gcc11-opt/setup.sh"
    source /cvmfs/sft.cern.ch/lcg/views/LCG_101/x86_64-centos7-gcc11-opt/setup.sh
else
    if ! [ -x "$(command -v geant4.sh)" ]; then
	echo 'Error: geant4 is not installed.' >&2
	exit 1
    else
	echo source geant4.sh
	source geant4.sh
    fi
fi
    
cd $CWD/musrSim-upgrade-public

if [[ ! -e "build" ]];
then
    mkdir build; cd build
    cmake -DCMAKE_INSTALL_PREFIX=$CWD/local  $CWD/musrSim-upgrade-public
    make -j6; make install
else
    echo Refresh installation.
    cd build
    cmake -DCMAKE_INSTALL_PREFIX=$CWD/local  $CWD/musrSim-upgrade-public
    make -j3; make install

fi

cd $CWD
