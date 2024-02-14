#!/bin/sh

echo "=================================="
echo "Update apt packages ..."
echo "=================================="

# update packages lists
sudo apt update

echo "=================================="
echo "Packages upgrade ..."
echo "=================================="

sudo apt upgrade
