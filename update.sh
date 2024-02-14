#!/bin/sh

# fail if any called scripts fail
set -e

# packages update
./scripts/packages.update.sh

# node update
./scripts/node.update.sh
