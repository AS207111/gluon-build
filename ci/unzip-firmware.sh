#!/bin/sh

set -e

rm -rf gluon firmware
unzip "*_output.zip" -d "firmware"
rm -rf firmware/debug firmware/packages
