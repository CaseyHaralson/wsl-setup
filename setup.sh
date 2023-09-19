#!/bin/sh

# fail if any called scripts fail
set -e

# update packages
./scripts/packages.sh

# git setup
./scripts/git.sh

# mamba python setup
./scripts/mamba.sh


