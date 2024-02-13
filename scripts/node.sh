#!/bin/sh

echo "=================================="
echo "Nodejs setup ..."
echo "=================================="

INSTALLABLE_VERSION=20

# install nvm and node
NODE=`command -v node | grep -v '/mnt/c/'`
if [ -z "$NODE" ]; then
  echo "Nodejs isn't installed. This will install nvm and default to Node $INSTALLABLE_VERSION."
  curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.5/install.sh | bash

  # get access to nvm
  NVM_DIR="$HOME/.nvm"
  [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm

  nvm install $INSTALLABLE_VERSION

  echo ""
  echo "Nodejs was installed. The shell needs to be reloaded."
  echo ""
fi
