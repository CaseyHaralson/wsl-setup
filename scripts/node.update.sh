#!/bin/sh

echo "=================================="
echo "Nodejs update ..."
echo "=================================="

MINIMUM_NODE_VERSION="v20.0.0"
INSTALLABLE_VERSION=20

# check to see if node is installed
NODE=`command -v node | grep -v '/mnt/c/'`
if [ -z "$NODE" ]; then
  echo "The Nodejs configuration might have been messed with during the package upgrade. Reinstalling..."
  ./scripts/node.sh
else

  # compare the version of node installed to the minimum version
  # and update if necessary
  NODE_VERSION=`node -v`
  if [ "$NODE_VERSION" \< "$MINIMUM_NODE_VERSION" ]; then
    echo "Nodejs is less than version $MINIMUM_NODE_VERSION. Updating..."

    # get access to nvm
    NVM_DIR="$HOME/.nvm"
    [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm

    nvm install --default $INSTALLABLE_VERSION

    echo ""
    echo "Nodejs was updated. The shell needs to be reloaded."
    echo ""
  else
    echo "Nodejs is up to date."
  fi
fi
