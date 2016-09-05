#!/usr/bin/env bash
#set -x

# Add dedicated camera sets for all genuine/unlocked vehicle slots

source ../setEnv.sh

SOURCE_CAMERAS=${TDUCP_PATH}/resources/physics/1.68B-cameras/cameras.bin
ULTIMATE_CAMERAS=${TDUCP_PATH}/resources/physics/ultimate-cameras/cameras.bin
TMP_CAMERAS=/tmp/cameras.bin

cp ${SOURCE_CAMERAS} ${TMP_CAMERAS}

echo "Applying camera patches from ${SOURCE_CAMERAS} to ${ULTIMATE_CAMERAS}, please wait..."
cat cameras.txt | while read CAM
do
    IFS=';' read -r -a array <<< ${CAM}
    SRC_CAM=${array[0]}
    DEST_CAM=${array[1]}

    echo "-> Base camera: ${SRC_CAM} to ${DEST_CAM}"
    ../tduf/cameraTool.sh copy-set -n -i "${TMP_CAMERAS}" -o "${TMP_CAMERAS}" -s ${SRC_CAM} -t ${DEST_CAM}
done

cp ${TMP_CAMERAS} ${ULTIMATE_CAMERAS}
