#!/usr/bin/env bash

makeDirectories() {
    echo "*** Preparing directories... ***"
    rm -rf ${BUILD_PATH}
    mkdir -p ${BUILD_TOOLS_PATH}
    mkdir -p ${BUILD_DB_PATH}
    mkdir -p ${BUILD_FX_PATH}
    mkdir -p ${RELEASE_PATH}
}

makeDirectoriesForUpdate() {
    makeDirectories
    mkdir -p ${INSTALLER_DB_PATH}
    mkdir -p ${INSTALLER_BANK_PATH}/FrontEnd/HiRes
    mkdir -p ${INSTALLER_BANK_PATH}/FrontEnd/LowRes
    echo
}

makeDirectoriesForFull() {
    makeDirectories
    mkdir -p ${BUILD_BANK_PATH}/FrontEnd/AllRes
    mkdir -p ${BUILD_BANK_PATH}/FrontEnd/HiRes
    mkdir -p ${BUILD_BANK_PATH}/FrontEnd/LowRes
    mkdir -p ${BUILD_BANK_PATH}/Level/Hawai
    echo
}

makeDirectoriesForPatchHD() {
    echo "*** Preparing directories... ***"
    rm -rf ${BUILD_PATH}
    mkdir -p ${BUILD_PATH}
    mkdir -p ${RELEASE_PATH}
}

