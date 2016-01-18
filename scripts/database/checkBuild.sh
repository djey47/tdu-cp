#!/usr/bin/env bash
#set -x

# Extracts database bank files from build into /tmp/tdu-cp/dbcheck directory.

source ../setEnv.sh

BUILD_DB_PATH=${TDUCP_PATH}/workspace/build/private/2.00A/Euro/Bnk/Database/
JSON_DB_PATH=/tmp/tdu-cp/dbcheck

rm -rf JSON_DB_PATH

echo "Checking current database from ${BUILD_DB_PATH}, please wait..."
../tduf/databaseTool.sh unpack-all -n -d ${BUILD_DB_PATH} -j ${JSON_DB_PATH} -x
