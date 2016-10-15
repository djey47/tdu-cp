#!/usr/bin/env bash
#set -x

# Add dedicated camera sets for all genuine/unlocked/new vehicle slots

source ../setEnv.sh

SOURCE_CAMERAS=${TDUCP_PATH}/resources/physics/cameras/1.68B/cameras.bin
ULTIMATE_CAMERAS=${TDUCP_PATH}/resources/physics/cameras/cameras.bin
TMP_CAMERAS=/tmp/cameras.bin
TMP_BATCH=/tmp/cameras.txt

cp ${SOURCE_CAMERAS} ${TMP_CAMERAS}
cp ./cameras.txt ${TMP_BATCH}

echo "Applying camera patches from ${SOURCE_CAMERAS} to ${ULTIMATE_CAMERAS}, please wait..."
../tduf/cameraTool.sh copy-sets -n -i "${TMP_CAMERAS}" -o "${TMP_CAMERAS}" -b "${TMP_BATCH}"

cp ${TMP_CAMERAS} ${ULTIMATE_CAMERAS}
