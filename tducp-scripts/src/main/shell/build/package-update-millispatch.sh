#!/usr/bin/env bash
#set -x
# Stop when any command fails
set -e

# Prepares packaging of Milli's Patch over TDUCP

source ../setEnv.sh
source util/init.sh
source util/files.sh
source util/database.sh
source util/tduf.sh
source util/win.sh

export BUILD_PATCH_VERSION=MillisPatch-1.3
export BUILD_PATH=${TDUCP_PATH}/workspace/build/private/${BUILD_PATCH_VERSION}
export INSTALLER_PATH=${BUILD_PATH}/MillisPatch-installer

# Init
setEnvMillisPatch
makeDirectoriesForMillisPatch

# Files
cleanBuild
newFilesForMillisPatch

# Database
diffPatches

# TDUF
deployTDUF

# Windows installer script
installerScript

# HTML documentation
htmlDoc

# Zip
makeZip MILLIS-PATCH-FOR-TDUCP

echo "All done!"
