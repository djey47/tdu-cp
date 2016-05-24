#!/usr/bin/env bash

setEnv() {
    echo "*** Setting packaging environment... ***"
    export INSTALLER_LIB_PATH=${BUILD_PATH}/TDUCP-lib
    echo
}

makeDirectories() {
    echo "*** Preparing directories... ***"
    rm -rf ${BUILD_PATH}
    mkdir -p ${INSTALLER_LIB_PATH}
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
