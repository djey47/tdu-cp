#!/usr/bin/env bash
#set -x

# Extracts database bank files from build into /tmp/tdu-cp/dbcheck directory and prcoesses eXtensive check.

source ../setEnv.sh

JSON_DB_PATH=/tmp/tdu-cp/dbcheck

rm -rf JSON_DB_PATH

echo "Checking current database from ${BUILD_DB_PATH}, please wait..."
../tduf/databaseTool.sh unpack-all -n -d ${BUILD_DB_PATH} -j ${JSON_DB_PATH} -x
