#!/bin/bash

CWD=$(pwd)

source  /cvmfs/sft.cern.ch/lcg/views/LCG_101/x86_64-centos7-gcc11-opt/setup.sh

cd $CWD/musrSim-upgrade-public

if [[ ! -e "build" ]];
then
    mkdir build; cd build
    cmake -DCMAKE_INSTALL_PREFIX=$CWD/local  $CWD/musrSim-upgrade-public
    make; make install
else
    echo Refresh installation.
    cd build
    cmake -DCMAKE_INSTALL_PREFIX=$CWD/local  $CWD/musrSim-upgrade-public
    make; make install

fi

cd $CWD
