#!/usr/bin/env bash
#set -x
# Stop when any command fails
set -e

# Prepares packaging of Community Patch: UPDATE VERSION

source ../setEnv.sh
source ./util/init.sh
source ./util/files.sh
source ./util/database.sh
source ./util/tduf.sh
source ./util/win.sh

export INSTALLER_PATH=${BUILD_PATH}/TDUCP-2.00A-installer
export INSTALLER_DB_PATH=${INSTALLER_PATH}/database
export INSTALLER_FILES_PATH=${INSTALLER_PATH}/files
export INSTALLER_TDUF_PATH=${INSTALLER_PATH}/tduf

# Init
makeDirectoriesForUpdate

# Files
newFiles
updatedPackedFiles

# Database
diffPatches

# TDUF
deployTDUF

# Windows installer script
installerScript

#Zip
makeZip UPDATE-TDUCP-2.00A

echo "All done!"
