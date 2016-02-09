#!/usr/bin/env bash
#set -x

# Prepares packaging of Community Patch
# Does not include all files yet (to be copied manually to BUILD PATH before launching script).

source ../setEnv.sh

BUILD_PATH=${TDUCP_PATH}/workspace/build/private/2.00A
RELEASE_PATH=${TDUCP_PATH}/workspace/releases
TARGET_DB_PATH=${BUILD_PATH}/Euro/Bnk/Database

# Init
echo "*** Preparing directories... ***"
mkdir -p ${BUILD_PATH}
mkdir -p ${TARGET_DB_PATH}
mkdir -p ${RELEASE_PATH}
echo

# Manifests
echo "*** Manifests... ***"
cp ${TDUCP_PATH}/manifests/*.md ${BUILD_PATH}
echo

# Unlocked slot files
echo "*** Unlocked slots files... ***"
cd ../slots/
./createFiles.sh
cd - > /dev/null
echo

# New slot files
# TODO use script without database update (create 2 separate scripts)

# Generate mapping
echo "*** Bnk1.map... ***"
cd ../mapping/
./generateCurrent.sh
cd - > /dev/null
echo

# References
echo "*** References... ***"
cp ${TDUCP_PATH}/resources/physics/tdumt/VehicleSlots.xml ${TARGET_DB_PATH}
echo

# Database
echo "*** Database... ***"
cd ../database/
./generateCurrent.sh
cd - > /dev/null
cp ${GENERATED_DB_PATH}/*.bnk ${TARGET_DB_PATH}
echo

# Other files
echo "*** Other contents ***"
echo "Consider adding remaining features manually"
echo

#Zip
#echo "*** Zipping... ***"
#pushd ${BUILD_PATH} > /dev/null
#TIMESTAMP=`date +%s`
#zip -r ${TDUCP_PATH}/workspace/releases/TDUCP-2.00A-${TIMESTAMP}.zip *
#popd > /dev/null
#echo
