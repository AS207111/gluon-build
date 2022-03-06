#!/bin/sh

set -e

export BROKEN=0
export GLUON_AUTOREMOVE=1
export GLUON_DEPRECATED=0
export GLUON_SITEDIR="../gluon-site"
export GLUON_TARGET=$1
export GLUON_BRANCH=$3
export BUILD_LOG=1
export NUM_CORES_PLUS_ONE=$(expr $(nproc) + 1)

git clone https://github.com/freifunk-gluon/gluon.git gluon -b "$2"
cd gluon
make update
make -j$NUM_CORES_PLUS_ONE V=s
