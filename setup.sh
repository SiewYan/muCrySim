#!/bin/bash

CWD=$(pwd)
DOMAIN=$(echo $HOSTNAME | awk -F "." '{print $NF}')
GEANT4VERSION="NONE"
ROOTVERSION="NONE"

check_path() {
  path_to_check="$1"

  # Loop through each directory in $PATH
  IFS=':' read -ra path_array <<< "$PATH"
  for dir in "${path_array[@]}"; do
      if [ "$dir" == "$path_to_check" ]; then
	  echo "Path '$path_to_check' exists in \$PATH."
	  return 0
      fi
  done
  
  echo "adding $path_to_check to PATH"
  export PATH=$path_to_check:/$PATH
  return 1
}

# Setup important dependencies
if [[ $DOMAIN == "sjtulocal" ]]; then
    echo "source /cvmfs/sft.cern.ch/lcg/views/LCG_101/x86_64-centos7-gcc11-opt/setup.sh"
    source /cvmfs/sft.cern.ch/lcg/views/LCG_101/x86_64-centos7-gcc11-opt/setup.sh
else
    # Geant4
    if ! [ -x "$(command -v geant4.sh)" ]; then
	echo 'Error: geant4 is not installed.' >&2
	exit
    else
	echo source geant4.sh
	source geant4.sh
	GEANT4VERSION=$(geant4-config --version)
    fi

    # ROOT
    if ! [ -x "$(command -v root)" ]; then
        echo 'Error: ROOT is not installed.' >&2
        exit
    else
        ROOTVERSION=$(root-config --version)
    fi
fi


    
cd $CWD/musrSim-upgrade-public

if [[ ! -e "build" ]];
then
    mkdir build; cd build
    cmake -DCMAKE_INSTALL_PREFIX=$CWD/local -DCMAKE_POLICY_VERSION_MINIMUM=3.5 $CWD/musrSim-upgrade-public
    make -j6; make install
else
    echo Refresh installation.
    cd build
    cmake -DCMAKE_INSTALL_PREFIX=$CWD/local -DCMAKE_POLICY_VERSION_MINIMUM=3.5 $CWD/musrSim-upgrade-public
    make -j3; make install
fi

# loading script
check_path $CWD/scripts
check_path $CWD/local/bin

echo "================================================================"
echo "                         SETUP SUMMARY"
echo "================================================================"
echo "⚡ Geant4 version     : ${GEANT4VERSION:-Not Found}"
echo "🌱 ROOT version       : ${ROOTVERSION:-Not Found}"
echo "🔬 musrsim installed  : $(command -v musrSim-upgrade-public 2>/dev/null || echo 'Not Found')"
echo "================================================================"
echo "Note : If you wish to reinstall, delete the build folder in musrSim and rerun source setup.sh"

cd $CWD
