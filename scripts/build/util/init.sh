#!/usr/bin/env bash

makeDirectories() {
    echo "*** Preparing directories... ***"
    rm -rf ${BUILD_PATH}
    mkdir -p ${BUILD_PATH}
    mkdir -p ${BUILD_DB_PATH}
    mkdir -p ${BUILD_FX_PATH}
    mkdir -p ${RELEASE_PATH}
    echo
}

makeDirectoriesForUpdate() {
    makeDirectories
    mkdir -p ${INSTALLER_PATH}
    mkdir -p ${INSTALLER_DB_PATH}
    mkdir -p ${INSTALLER_FILES_PATH}
}
