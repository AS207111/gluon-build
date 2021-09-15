#!/bin/sh

set -e

apt-get update
apt-get install git subversion python3 build-essential gawk unzip libncurses-dev libz-dev libssl-dev wget time qemu-utils
apt clean
