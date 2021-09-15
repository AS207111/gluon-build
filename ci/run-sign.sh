#!/bin/sh

set -e

export BROKEN=0
export GLUON_AUTOREMOVE=1
export GLUON_DEPRECATED=0
export GLUON_SITEDIR="../gluon-site"
export GLUON_TARGET=$1
export BUILD_LOG=1
export NUM_CORES_PLUS_ONE=$(expr $(nproc) + 1)

git clone https://github.com/freifunk-gluon/gluon.git gluon -b v2021.1
cp -r firmware gluon/output
cd gluon
make update
make manifest

contrib/sign.sh "$SECRETKEY" output/images/factory/experimental.manifest
contrib/sign.sh "$SECRETKEY" output/images/other/experimental.manifest
contrib/sign.sh "$SECRETKEY" output/images/sysupgrade/experimental.manifest
