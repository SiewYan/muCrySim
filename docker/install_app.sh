#!/bin/bash

CWD=`pwd`
WORKSPACE=$(echo $CWD | awk -F '/' '{print $NF}')

# crySIM
CRYSIM="siewyanhoh/musim:crySim-1.0"
# Paraview
PARAVIEW="siewyanhoh/musim:paraView-1.0"

#
if [[ $WORKSPACE != "docker" ]]; then
    echo 'Error: please run the install script in the docker folder' >&2
    exit
fi

#
makeApp () {    
    mkdir -p ${CWD}/app
    cat <<EOF > ${CWD}/app/${1}
#/bin/bash
CCWD=\`pwd\`
docker run -it --rm -v \${CCWD}:/opt/muCrySim/docker/run ${2} \$@
EOF
    chmod +x ${CWD}/app/${1}
    echo app is installed at ${CWD}/app/${1}
}

#
if ! [ -x "$(command -v docker)" ]; then
    echo 'Error: docker is not installed.' >&2
    exit
else
    echo Docker found! , `docker --version` >&2 
    #
    echo "Installing crySim"
    docker pull $CRYSIM
    makeApp muCrySim $CRYSIM
fi
