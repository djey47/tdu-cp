#!/usr/bin/env bash
#set -x

# Prepares packaging of Community Patch: FULL VERSION

source ../setEnv.sh
source ./util/init.sh
source ./util/files.sh
source ./util/database.sh

# Init
makeDirectories

#Files
newFiles
replacedFiles
generateMapping

# Database
generateAndCheckDatabase

#Zip
#echo "*** Zipping... ***"
#pushd ${BUILD_PATH} > /dev/null
#TIMESTAMP=`date +%s`
#zip -r ${TDUCP_PATH}/workspace/releases/FULL-TDUCP-2.00A-${TIMESTAMP}.zip *
#popd > /dev/null
#echo
