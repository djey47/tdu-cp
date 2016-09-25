#!/usr/bin/env bash

diffPatches() {
    echo "*** Database diff patches... ***"
    INSTALLER_PATCHES_PATH=${INSTALLER_DB_PATH}/patches
    mkdir -p ${INSTALLER_PATCHES_PATH}
    cp ${DIFF_PATCHES_PATH}/*.json ${INSTALLER_PATCHES_PATH}
    echo
}

generateAndCheckDatabase() {
    echo "*** Database... ***"
    cd ../database/
    ./generateCurrent.sh && ./checkBuild.sh
    cd - > /dev/null
    echo
}

cameraInstructions() {
    echo "*** Camera extension instructions... ***"
    SOURCE_PATH=${DEV_SCRIPTS_PATH}/database/cameras.txt
    TARGET_PATH=${INSTALLER_DB_PATH}/cameras.txt
    cp ${SOURCE_PATH} ${TARGET_PATH}
    echo
}

cameraInstructionsForMillisPatch() {
    echo "*** Camera extension instructions... ***"
    SOURCE_PATH=${DEV_SCRIPTS_PATH}/database/camerasForCarPack.txt
    TARGET_PATH=${INSTALLER_DB_PATH}/cameras.txt
    cp ${SOURCE_PATH} ${TARGET_PATH}
    echo
}
