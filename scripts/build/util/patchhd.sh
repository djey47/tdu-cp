#!/usr/bin/env bash

includePatchHD() {
    export INSTALLER_PATH=${BUILD_PATH}/TDUCP-PATCHHD-installer
    export INSTALLER_FILES_PATH=${INSTALLER_PATH}/files
    export PATCH_HD_RESOURCES_PATH=${TDUCP_PATH}/resources/system/2CV-patch-hd
    export SCRIPTS_PATH=${SCRIPTS_PATH}/patch-hd

    echo "*** Patch HD settings... ***"

    # Files
    newFilesForPatchHD
    updatedPackedFilesForPatchHD

    # TDUF
    deployTDUF

    # Windows installer script
    installerScript

    echo
}
