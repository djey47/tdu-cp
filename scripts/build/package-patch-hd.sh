#!/usr/bin/env bash
#set -x
set -e

# Prepares packaging of PATCH HD

source ../setEnv.sh
source ./util/init.sh
source ./util/files.sh
source ./util/win.sh

# Init
export BUILD_PATH=${TDUCP_PATH}/workspace/build/private/PATCH-HD-OD
makeDirectoriesForPatchHD

# Files
export INSTALLER_FILES_PATH=${BUILD_PATH}/TDUCP-PATCHHD-installer/files
export PATCH_HD_RESOURCES_PATH=${TDUCP_PATH}/resources/system/2CV-patch-hd
newFilesForPatchHD
updatedPackedFilesForPatchHD

# Windows installer script
export SCRIPTS_PATH=${SCRIPTS_PATH}/patch-hd
installerScript

#Zip
makeZip TDUCP-PATCH-HD

echo "All done!"

