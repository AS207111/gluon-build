#!/bin/sh

set -e

export BROKEN=0
export GLUON_AUTOREMOVE=1
export GLUON_DEPRECATED=0
export GLUON_SITEDIR="../gluon-site"
export GLUON_TARGET=$1
export BUILD_LOG=1
export NUM_CORES_PLUS_ONE=$(expr $(nproc) + 1)

cd gluon
make update
make -j$NUM_CORES_PLUS_ONE V=s
make manifest GLUON_AUTOUPDATER_BRANCH=experimental
contrib/sign.sh $SECRETKEY output/images/sysupgrade/experimental.manifest
