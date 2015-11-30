#!/usr/bin/env bash
#set -x

# Prepares packaging of Community Patch.
# Will use generated Database banks in $GENERATED_DB_PATH directory

source ../setEnv.sh

BUILD_PATH=${TDUCP_PATH}/workspace/build

# Manifests
cp ${TDUCP_PATH}/manifests/*.md ${TDUCP_PATH}/workspace/build

# Database
TARGET_DB_PATH=${BUILD_PATH}/Euro/Bnk/Database
mkdir -p ${TARGET_DB_PATH}
cp ${GENERATED_DB_PATH}/*.bnk ${TARGET_DB_PATH}

#Zip
#TODO
