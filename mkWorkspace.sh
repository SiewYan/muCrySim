#!/bin/bash

CWD=$(pwd)
PREFIX="sim"
counter=0

echo Making workspace for $USER on $HOSTNAME

# name of run
echo $1

if [[ -z $1 ]]; then

    while [ -d "${PREFIX}-$(printf "%02d" $counter)" ]; do
	counter=$((counter + 1))
    done
    
    echo Folder name is not provided, creating ${PREFIX}-$(printf "%02d" $counter)
    mkdir -p ${CWD}/${PREFIX}-$(printf "%02d" $counter)/data
    cp ${CWD}/mac/visVRML.mac ${CWD}/${PREFIX}-$(printf "%02d" $counter)
else
    echo Creating ${PREFIX}-$1
    mkdir -p ${CWD}/${PREFIX}-$1/data
    cp ${CWD}/mac/visVRML.mac ${CWD}/${PREFIX}-$1
fi

echo "Workspace created, example mac files can be found in ${CWD}/mac, feel free to copy your favourite mac into the prepare workspace"
