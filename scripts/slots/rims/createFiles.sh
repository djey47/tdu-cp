#!/usr/bin/env bash
#set -x

# Create required files for own rims.

source ../../setEnv.sh

echo "-> Creating rim files..."
cat rims_saleen.txt | while read name
do
   echo "-${name}"
   PARENT_PATH=`dirname "${BUILD_RIMS_PATH}/${name}"`
   mkdir -p "${PARENT_PATH}"
   cp ${DEFAULT_RIM_PATH}/SALEEN.bnk "${BUILD_RIMS_PATH}/${name}.bnk"
done

cat rims_alfa.txt | while read name
do
   echo "-${name}"
   PARENT_PATH=`dirname "${BUILD_RIMS_PATH}/${name}"`
   mkdir -p "${PARENT_PATH}"
   cp ${DEFAULT_RIM_PATH}/ALFAGT.bnk "${BUILD_RIMS_PATH}/${name}.bnk"
done

cat rims_nissan.txt | while read name
do
   echo "-${name}"
   PARENT_PATH=`dirname "${BUILD_RIMS_PATH}/${name}"`
   mkdir -p "${PARENT_PATH}"
   cp ${DEFAULT_RIM_PATH}/NISSAN350Z.bnk "${BUILD_RIMS_PATH}/${name}.bnk"
done
echo