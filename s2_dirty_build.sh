#!/bin/bash

# Original script by Nvertigo https://github.com/nvertigo/local_manifest

# if you want to build without using ccache, comment
# the next 4 lines
export USE_CCACHE=1
export CCACHE_DIR=~/.ccache
export CCACHE_MAX_SIZE=50G
export CCACHE_EXEC=$(which ccache)
ccache -M $CCACHE_MAX_SIZE

# encapsulate the build's temp directory.
# This way it's easier to clean up afterwards
TMP=$(mktemp -dt)
TMPDIR=$TMP
TEMP=$TMP

export TMP TMPDIR TEMP

#make sure jack-server is restarted in TMP
prebuilts/sdk/tools/jack-admin kill-server

# we want all compiler messages in English
export LANGUAGE=C

# set up the environment (variables and functions)
source build/envsetup.sh

# clean the out dir; comment out, if you want to do
# a dirty build
# make -j6 ARCH=arm clean

# fire up the building process and also log stdout
# and stderrout
breakfast lineage_s2-userdebug 2>&1 | tee s2_breakfast.log && \
brunch lineage_s2-userdebug 2>&1 | tee s2_make.log

#make sure jack-server is stopped in TMP before removal
prebuilts/sdk/tools/jack-admin kill-server

# remove all temp directories
rm -rf ${TMP}
