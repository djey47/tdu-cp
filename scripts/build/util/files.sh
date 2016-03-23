#!/usr/bin/env bash

# For full package
replacedFiles() {
    echo "*** 1.68b's Cameras ***"
    cp ${TDUCP_PATH}/resources/physics/1.68B-cameras/cameras.bin ${BUILD_DB_PATH}
    echo

    # TODO Brand logos, menu logo, Patch HD Level files
    # TODO Slot files : in full package (classic location), or separate location in update package
#    # Unlocked slot files
#    echo "*** Unlocked slots files... ***"
#    cd ../slots/unlocked
#    ./createFiles.sh
#    cd - > /dev/null
#    echo
#
#    # New slot files
#    echo "*** New slots files... ***"
#    cd ../slots/new
#    ./createFiles.sh
#    cd - > /dev/null
#    echo
#
#    # Own rims files
#    echo "*** Own rims files... ***"
#    cd ../slots/rims
#    ./createFiles.sh
#    cd - > /dev/null
#    echo
}

# For both full and update packages: to replace existing files in TDU install while extracting ZIP
newFiles() {
    echo "*** Manifests... ***"
    cp ${TDUCP_PATH}/manifests/*.md ${BUILD_PATH}
    echo

    echo "*** References... ***"
    mkdir -p ${BUILD_TOOLS_PATH}
    cp ${TDUCP_PATH}/resources/physics/tdumt/VehicleSlots.xml ${BUILD_TOOLS_PATH}
    cp ${TDUCP_PATH}/resources/physics/tdupe/carData.mdb ${BUILD_TOOLS_PATH}
    echo

    echo "*** G27 fix... ***"
    cp ${TDUCP_PATH}/resources/system/LeanSpeeder-G27-fix/dinput8.dll ${BUILD_PATH}
    echo

    echo "*** FX configuration for PATCH HD (SD MODE)... ***"
    unzip -o ${TDUCP_PATH}/resources/system/2CV-patch-hd/FX.ini.hd.zip -d ${BUILD_FX_PATH}
    echo

    echo "*** Default traffic configuration ***"
    cp ${TDUCP_PATH}/resources/ia/default-traffic/AIConfig.xml ${BUILD_DB_PATH}
    echo
}

# For update package: to replace in existing BNK files by Windows installer script
updatedPackedFiles() {
    INSTALLER_FILES_PATCHES_PATH=${INSTALLER_FILES_PATH}/patches
    mkdir -p ${INSTALLER_FILES_PATCHES_PATH}

    TEXTURES_LOW_PATH=${INSTALLER_FILES_PATH}/textures-low
    TEXTURES_HIGH_PATH=${INSTALLER_FILES_PATH}/textures-high
    mkdir -p ${TEXTURES_LOW_PATH}
    mkdir -p ${TEXTURES_HIGH_PATH}

    echo "*** Textures for MENU LOGO... ***"
    cp ${TDUCP_PATH}/resources/textures/menus/\(LOW\)fla_0013.2db ${TEXTURES_LOW_PATH}/fla_0013.2db
    cp ${TDUCP_PATH}/resources/textures/menus/\(HI\)fla_0013.2db ${TEXTURES_HIGH_PATH}/fla_0013.2db
    echo

    echo "*** Textures for BRAND LOGOS... ***"
    cp ${TDUCP_PATH}/resources/textures/logos/icons_map.2db ${TEXTURES_HIGH_PATH}
    cp ${TDUCP_PATH}/resources/textures/logos/logos_brands.2db ${TEXTURES_HIGH_PATH}
    cp ${TDUCP_PATH}/resources/textures/logos/patches/* ${INSTALLER_FILES_PATCHES_PATH}
    echo

    echo "*** 3D Definition files for PATCH HD (SD MODE)... ***"
    cp ${TDUCP_PATH}/resources/system/2CV-patch-hd/SD/Library.3DD ${INSTALLER_FILES_PATH}
    echo
}

# For full release only: mapping update will be performed by Windows installer script
generateMapping() {
    echo "*** Bnk1.map... ***"
    cd ../mapping/
    ./generateCurrent.sh
    cd - > /dev/null
    echo
}

makeZip() {
    echo "*** Zipping... ***"
    pushd ${BUILD_PATH} > /dev/null
    TIMESTAMP=`date +%s`
    zip -r ${TDUCP_PATH}/workspace/releases/$1-${TIMESTAMP}.zip *
    popd > /dev/null
    echo
}
