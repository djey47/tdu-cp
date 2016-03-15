#!/usr/bin/env bash

diffPatches() {
    echo "*** Database diff patches... ***"
    INSTALLER_PATCHES_PATH=${INSTALLER_DB_PATH}/patches
    mkdir -p ${INSTALLER_PATCHES_PATH}
    cp ${DIFF_PATCHES_PATH}/*.json ${INSTALLER_PATCHES_PATH}
    echo
}
