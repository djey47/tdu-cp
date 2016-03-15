#!/usr/bin/env bash

diffPatches() {
    echo "*** Database diff patches... ***"
    cp DIFF_PATCHES_PATH/*.json ${INSTALLER_DB_PATH}/patches
    echo
}
