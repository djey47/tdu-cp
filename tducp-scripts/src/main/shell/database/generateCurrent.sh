#!/usr/bin/env bash
#set -x

# Creates database bank files into workspace/build/private/2.00A/Euro/Bnk/Database directory from JSON files in database/current.
# Requires original- bank files to be present in database/current.

source ../setEnv.sh

echo "Generating database from ${CURRENT_DB_PATH}, to ${BUILD_DB_PATH} please wait..."
../tduf/databaseTool.sh repack-all -j ${CURRENT_DB_PATH} -o ${BUILD_DB_PATH}
