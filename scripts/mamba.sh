#!/bin/sh

echo "=================================="
echo "Mamba Python setup ..."
echo "=================================="

STARTING_DIR=$(pwd)
TEMP_DIR=$STARTING_DIR/scripts/temp

# istall mamba
MAMBA_LOCATION=`command -v mamba`
if [ -z "$MAMBA_LOCATION" ]; then
  echo "Mamba isn't installed. Installing it now."
  cd $TEMP_DIR
  curl -L -O "https://github.com/conda-forge/miniforge/releases/latest/download/Mambaforge-Linux-x86_64.sh"
  bash Mambaforge-Linux-x86_64.sh 

  echo ""
  echo "Mamba was installed. The shell needs to be reloaded."
  echo ""
fi

# set mamba to not auto-activate
AUTO_ACTIVATE_BASE=`cat ~/mambaforge/.condarc | grep auto_activate_base`
if [ -z "$AUTO_ACTIVATE_BASE" ]; then
  echo "auto_activate_base: false" >> ~/mambaforge/.condarc
fi
