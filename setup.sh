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

# ensure LIB is loaded
check_lib() {
    local lib_to_check="$1"

    case "$(uname)" in
        Darwin*) lib_var="DYLD_LIBRARY_PATH" ;;
        Linux*)  lib_var="LD_LIBRARY_PATH" ;;
        *)       lib_var="LD_LIBRARY_PATH" ;;
    esac

    # Get the actual value of the variable, not the variable name
    local current_path="${!lib_var}"

    # Loop through each directory in the library path
    if [ -n "$current_path" ]; then
        IFS=':' read -ra lib_array <<< "$current_path"
        for dir in "${lib_array[@]}"; do
            if [ "$dir" == "$lib_to_check" ]; then
                echo "Path '$lib_to_check' exists in \$$lib_var."
                return 0
            fi
        done
    fi

    echo "Adding '$lib_to_check' to $lib_var"
    
    # Fix the export - use the variable value, not a literal slash
    if [ -z "$current_path" ]; then
        export "$lib_var"="$lib_to_check"
    else
        export "$lib_var"="$lib_to_check:$current_path"
    fi
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
	GEANT4VERSION=$(geant4-config --version 2>/dev/null || echo "Unknown")
    fi

    # ROOT
    if ! which root >/dev/null 2>&1; then
        echo 'Error: ROOT is not installed.' >&2
        exit 1
    else
        ROOTVERSION=$(root-config --version 2>/dev/null || echo "Unknown")
    fi
fi


## cry data replace
# Replace hardcoded path with current directory
replace_cry_data_path() {
    local source_file="$1/src/musrPrimaryGeneratorAction.cc"
    local current_dir=$(pwd)
    local new_path="$current_dir/cryData"
    
    if [ ! -f "$source_file" ]; then
        print_warning "File not found: $source_file"
        return
    fi
    
    # Check if the line already has the correct path
    if grep -q "std::string cryDataPath = \"$new_path\";" "$source_file"; then
        echo "CRY data path is already correct: $new_path"
        return 0
    fi
    
    # Check if the pattern exists but with different path
    if grep -q 'std::string cryDataPath =' "$source_file"; then
        local current_line=$(grep 'std::string cryDataPath =' "$source_file")
        echo "Found existing line: $current_line"
        echo "Replacing with: $new_path"
        
        # Perform replacement
        sed -i.bak "s|std::string cryDataPath = [^;]*;|std::string cryDataPath = \"$new_path\";|" "$source_file"
        
        # Verify
        if grep -q "std::string cryDataPath = \"$new_path\";" "$source_file"; then
            echo "Successfully updated CRY data path"
        else
            echo "Failed to update CRY data path"
            return 1
        fi
    else
        echo "Target line 'std::string cryDataPath =' not found in $source_file"
        return 1
    fi
}

#
cd $CWD/musrSim-upgrade-public
replace_cry_data_path "."

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

# append lib
check_lib $(geant4-config --libs | sed 's/.*-L\([^ ]*\).*/\1/')

echo "================================================================"
echo "                         SETUP SUMMARY"
echo "================================================================"
echo "⚡ Geant4 version     : ${GEANT4VERSION:-Not Found}"
echo "🌱 ROOT version       : ${ROOTVERSION:-Not Found}"
echo "🔬 musrsim installed  : $(which musrSim_upgrade 2>/dev/null || echo 'Not Found')"
echo "================================================================"
echo "Note : If you wish to reinstall, delete the build folder in musrSim and rerun source setup.sh"

cd $CWD
