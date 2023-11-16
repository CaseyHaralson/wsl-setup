#!/bin/sh

echo "=================================="
echo "Terraform setup ..."
echo "=================================="

# install terraform
TERRAFORM=`command -v terraform | grep -v '/mnt/c/'`
if [ -z "$TERRAFORM" ]; then
  echo "The terraform cli isn't installed. This will install it."

  # add the distribution url as a package source
  echo "deb [signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] https://apt.releases.hashicorp.com $(lsb_release -cs) main" | sudo tee -a /etc/apt/sources.list.d/hashicorp.list

  # add the distribution's public key
  wget -O- https://apt.releases.hashicorp.com/gpg | gpg --dearmor | sudo tee /usr/share/keyrings/hashicorp-archive-keyring.gpg

  # update the packages to include the new source
  sudo apt update

  # install the cli
  sudo apt install terraform
fi
