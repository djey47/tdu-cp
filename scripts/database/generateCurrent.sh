#!/usr/bin/env bash
#set -x

# Creates database bank files into /workspace/wip/private/database-generated directory from JSON files in database/current.
# Requires original- bank files to be present in database/current.

source ../setEnv.sh

echo "Generating database from ${CURRENT_DB_PATH}, to ${GENERATED_DB_PATH} please wait..."
../tduf/databaseTool.sh repack-all -j ${CURRENT_DB_PATH} -o ${GENERATED_DB_PATH}
