#!/usr/bin/env bash
#set -x

# Prepares packaging of Community Patch
# Does not include all files yet (to be copied manually to BUILD PATH before launching script).

source ../setEnv.sh

BUILD_PATH=${TDUCP_PATH}/workspace/build/private/2.00A
RELEASE_PATH=${TDUCP_PATH}/releases

# Manifests
echo "*** Manifests... ***"
cp ${TDUCP_PATH}/manifests/*.md ${BUILD_PATH}
echo

# Generate mapping
echo "*** Bnk1.map... ***"
cd ../mapping/
./generateCurrent.sh
cd - > /dev/null
echo

# Database
echo "*** Database... ***"
cd ../database/
./generateCurrent.sh
cd - > /dev/null
TARGET_DB_PATH=${BUILD_PATH}/Euro/Bnk/Database
mkdir -p ${TARGET_DB_PATH}
cp ${GENERATED_DB_PATH}/*.bnk ${TARGET_DB_PATH}
echo

#Zip
echo "*** Zipping... ***"
pushd ${BUILD_PATH} > /dev/null
TIMESTAMP=`date +%s`
zip -r ${TDUCP_PATH}/workspace/releases/TDUCP-2.00A-${TIMESTAMP}.zip *
popd > /dev/null
echo
