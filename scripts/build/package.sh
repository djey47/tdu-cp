#!/usr/bin/env bash
#set -x

# Prepares packaging of Community Patch.
# Will use generated Database banks in $GENERATED_DB_PATH directory

source ../setEnv.sh

BUILD_PATH=${TDUCP_PATH}/workspace/build/private/2.00A
RELEASE_PATH=${TDUCP_PATH}/releases

# Manifests
echo "-> Manifests..."
cp ${TDUCP_PATH}/manifests/*.md ${BUILD_PATH}

# Generate mapping
echo "-> Bnk1.map..."
cd ../mapping/
./generateCurrent.sh
cd - > /dev/null

# Database
echo "-> Database..."
TARGET_DB_PATH=${BUILD_PATH}/Euro/Bnk/Database
mkdir -p ${TARGET_DB_PATH}
cp ${GENERATED_DB_PATH}/*.bnk ${TARGET_DB_PATH}

#Zip
echo "-> Zipping..."
pushd ${BUILD_PATH} > /dev/null
zip -r ${TDUCP_PATH}/workspace/releases/TDUCP-2.00A-NEW.zip *
popd > /dev/null
