#!/bin/sh

echo "=================================="
echo "Update apt packages ..."
echo "=================================="

# update packages lists
sudo apt update

echo "=================================="
echo "Basic packages setup ..."
echo "=================================="

# install ifconfig
LOC=`command -v ifconfig`
if [ -z "$LOC" ]; then
  echo "ifconfig isn't installed. This will install it."
  sudo apt install net-tools
fi

# install curl
LOC=`command -v curl`
if [ -z "$LOC" ]; then
  echo "curl isn't installed. This will install it."
  sudo apt install curl
fi

# install jq
LOC=`command -v jq`
if [ -z "$LOC" ]; then
  echo "jq isn't installed. This will install it."
  sudo apt install jq
fi

# install zip
LOC=`command -v zip`
if [ -z "$LOC" ]; then
  echo "zip isn't installed. This will install it."
  sudo apt install zip
fi

# install apt-transport-https (group of packages)
# needed by gcloud
LOC=`dpkg -l apt-transport-https | grep 'ii  apt-transport-https'`
if [ -z "$LOC" ]; then
  echo "apt-transport-https isn't installed. This will install it."
  sudo apt install apt-transport-https
fi

# install ca-certificates (group of packages)
# needed by gcloud
LOC=`dpkg -l ca-certificates | grep 'ii  ca-certificates'`
if [ -z "$LOC" ]; then
  echo "ca-certificates isn't installed. This will install it."
  sudo apt install ca-certificates
fi

# install gnupg (group of packages)
# needed by gcloud, terraform
LOC=`dpkg -l gnupg | grep 'ii  gnupg'`
if [ -z "$LOC" ]; then
  echo "gnupg isn't installed. This will install it."
  sudo apt install gnupg
fi

# install software-properties-common (group of packages)
# needed by terraform
LOC=`dpkg -l software-properties-common | grep 'ii  software-properties-common'`
if [ -z "$LOC" ]; then
  echo "software-properties-common isn't installed. This will install it."
  sudo apt install software-properties-common
fi
