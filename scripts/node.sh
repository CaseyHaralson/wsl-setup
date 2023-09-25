#!/bin/sh

echo "=================================="
echo "Node setup ..."
echo "=================================="

# install nvm and node
NODE=`command -v node | grep -v '/mnt/c/'`
if [ -z "$NODE" ]; then
  echo "Node isn't installed. This will install nvm and default to Node 18."
  curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.5/install.sh | bash

  # get access to nvm
  NVM_DIR="$HOME/.nvm"
  [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm

  nvm install 18

  echo ""
  echo "Node was installed. The shell needs to be reloaded."
  echo ""
fi
