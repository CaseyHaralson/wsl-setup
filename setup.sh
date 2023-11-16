#!/bin/sh

# fail if any called scripts fail
set -e

# packages setup
./scripts/packages.sh

# git setup
./scripts/git.sh

# python setup
./scripts/python.sh

# node setup
./scripts/node.sh

# gcloud setup
./scripts/gcloud.sh

# terraform setup
./scripts/terraform.sh
