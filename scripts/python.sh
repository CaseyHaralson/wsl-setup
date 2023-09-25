#!/bin/sh

echo "=================================="
echo "Python setup ..."
echo "=================================="

STARTING_DIR=$(pwd)
TEMP_DIR=$STARTING_DIR/scripts/temp

# install mamba
MAMBA_SHELL=`cat ~/.bashrc | grep mamba.sh`
if [ -z "$MAMBA_SHELL" ]; then
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

# install quarto
QUARTO=`command -v quarto`
if [ -z "$QUARTO" ]; then
  echo "Quarto isn't installed. Installing it now."
  cd $TEMP_DIR
  curl -L -o quarto.deb "https://github.com/quarto-dev/quarto-cli/releases/download/v1.3.450/quarto-1.3.450-linux-amd64.deb"
  sudo dpkg -i quarto.deb
  cd $STARTING_DIR
fi
