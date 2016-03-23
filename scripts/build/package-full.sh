#!/usr/bin/env bash
#set -x
set -e

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
makeZip FULL-TDUCP-2.00A

echo "All done!"
