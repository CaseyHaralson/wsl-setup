#!/bin/sh

echo "=================================="
echo "Update apt packages ..."
echo "=================================="

# update packages lists
sudo apt update

# install ifconfig
IFCONFIG=`command -v ifconfig`
if [ -z "$IFCONFIG" ]; then
  echo "ifconfig isn't installed. This will install net-tools."
  sudo apt install net-tools
fi
