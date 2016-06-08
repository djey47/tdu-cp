#!/usr/bin/env bash
#set -x
set -e

# Prepares packaging of Community Patch: FULL VERSION

source ../setEnv.sh
source ./util/init.sh
source ./util/files.sh
source ./util/database.sh
source ./util/tduf.sh
source ./util/win.sh
source ./util/patchhd.sh

# Init
setEnv
makeDirectoriesForFull

# Files
newFilesForFull
replacedFiles
generateMapping

# Database
generateAndCheckDatabase

# TDUF
deployTDUF

# Patch HD - Settings App
includePatchHD

# HTML documentation
htmlDoc

# Zip
makeZip FULL-TDUCP-2.00A

echo "All done!"
