#!/bin/sh

echo "=================================="
echo "GCloud setup ..."
echo "=================================="

# install gcloud
GCLOUD=`command -v gcloud | grep -v '/mnt/c/'`
if [ -z "$GCLOUD" ]; then
  echo "The gcloud cli isn't installed. This will install it."

  # add the distribution url as a package source
  echo "deb [signed-by=/usr/share/keyrings/cloud.google.asc] https://packages.cloud.google.com/apt cloud-sdk main" | sudo tee -a /etc/apt/sources.list.d/google-cloud-sdk.list

  # add the distribution's public key
  curl https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo tee /usr/share/keyrings/cloud.google.asc

  # update the packages to include the new source
  sudo apt update

  # install the cli
  sudo apt install google-cloud-cli
fi
