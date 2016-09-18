#!/usr/bin/env bash

setEnv() {
    echo "*** Setting packaging environment... ***"
    export INSTALLER_LIB_PATH=${BUILD_PATH}/TDUCP-lib
    export MARKDOWN_SRC_PATH=${TDUCP_PATH}/tducp-scripts/src/markdown/
    export CMD_SCRIPTS_PATH=${DEV_SCRIPTS_PATH}/../cmd/tducp-update
    echo
}

setEnvMillisPatch() {
    setEnv
    export INSTALLER_DB_PATH=${INSTALLER_PATH}/database
    export INSTALLER_FILES_PATH=${INSTALLER_PATH}/files
    export INSTALLER_BANK_PATH=${INSTALLER_FILES_PATH}/Euro/Bnk
    export INSTALLER_TDUF_PATH=${INSTALLER_PATH}/tduf

    export CMD_SCRIPTS_PATH=${DEV_SCRIPTS_PATH}/../cmd/millispatch

    export DIFF_PATCHES_PATH=${TDUCP_PATH}/database/patches/0-ALL-FullUpdate-CarPack
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
    mkdir -p ${BUILD_BANK_PATH}/Vehicules
    echo
}

makeDirectoriesForMillisPatch() {
    makeDirectories
    echo
}
