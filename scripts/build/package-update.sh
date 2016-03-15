#!/usr/bin/env bash
#set -x

# Prepares packaging of Community Patch: UPDATE VERSION

source ../setEnv.sh
source ./util/init.sh
source ./util/files.sh
source ./util/database.sh

export INSTALLER_PATH=${BUILD_PATH}/TDUCP-2.00A-installer
export INSTALLER_DB_PATH=${BUILD_PATH}/TDUCP-2.00A-installer/database
export INSTALLER_FILES_PATH=${BUILD_PATH}/TDUCP-2.00A-installer/files

# Init
makeDirectoriesForUpdate

# Files
newFiles
updatedBankFiles

# Database
diffPatches

#Zip
#echo "*** Zipping... ***"
#pushd ${BUILD_PATH} > /dev/null
#TIMESTAMP=`date +%s`
#zip -r ${TDUCP_PATH}/workspace/releases/UPDATE-TDUCP-2.00A-${TIMESTAMP}.zip *
#popd > /dev/null
#echo
