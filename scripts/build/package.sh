#!/usr/bin/env bash
#set -x

# Prepares packaging of Community Patch
# Does not include all files yet (to be copied manually to BUILD PATH before launching script).

source ../setEnv.sh

RELEASE_PATH=${TDUCP_PATH}/workspace/releases

# Init
echo "*** Preparing directories... ***"
mkdir -p ${BUILD_PATH}
mkdir -p ${BUILD_DB_PATH}
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
cp ${TDUCP_PATH}/resources/physics/tdumt/VehicleSlots.xml ${BUILD_DB_PATH}
cp ${TDUCP_PATH}/resources/physics/tdupe/carData.mdb ${BUILD_DB_PATH}
echo

# Database
echo "*** Database... ***"
cd ../database/
./generateCurrent.sh
./checkBuild.sh
cd - > /dev/null
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
