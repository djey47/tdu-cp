#!/usr/bin/env bash
#set -x

# Prepares packaging of Community Patch
# Does not include all files yet (to be copied manually to BUILD PATH before launching script).

source ../setEnv.sh

BUILD_PATH=${TDUCP_PATH}/workspace/build/private/PATCH-HD-OD
RELEASE_PATH=${TDUCP_PATH}/releases

#Zip
echo "*** Zipping... ***"
pushd ${BUILD_PATH} > /dev/null
TIMESTAMP=`date +%s`
zip -r ${TDUCP_PATH}/workspace/releases/TDUCP-PATCH-HD-ON-DEMAND-${TIMESTAMP}.zip *
popd > /dev/null
echo
