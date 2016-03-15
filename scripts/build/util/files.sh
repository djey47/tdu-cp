#!/usr/bin/env bash

replacedFiles() {
    echo "*** FX configuration for PATCH HD (SD MODE)... ***"
    unzip -o ${TDUCP_PATH}/resources/system/2CV-patch-hd/FX.ini.hd.zip -d ${BUILD_FX_PATH}
    echo
}

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
}

updatedBankFiles() {
    TEXTURES_LOW_PATH=${INSTALLER_FILES_PATH}/textures-low
    TEXTURES_HIGH_PATH=${INSTALLER_FILES_PATH}/textures-high
    mkdir -p TEXTURES_LOW_PATH
    mkdir -p TEXTURES_HIGH_PATH

    echo "*** Textures for MENU LOGO... ***"
    cp ${TDUCP_PATH}/resources/textures/menus/\(LOW\)fla_0013.2db ${TEXTURES_LOW_PATH}/fla_0013.2db
    cp ${TDUCP_PATH}/resources/textures/menus/\(HI\)fla_0013.2db ${TEXTURES_HIGH_PATH}/fla_0013.2db
    echo

    echo "*** Textures for BRAND LOGOS... ***"
    cp ${TDUCP_PATH}/resources/textures/logos/icons_map.2db ${TEXTURES_HIGH_PATH}
    cp ${TDUCP_PATH}/resources/textures/logos/logos_brands.2db ${TEXTURES_HIGH_PATH}
    echo

    echo "*** 3D Definition files for PATCH HD (SD MODE)... ***"
    cp ${TDUCP_PATH}/resources/system/2CV-patch-hd/SD/Library.3DD ${INSTALLER_FILES_PATH}
    echo
}

# Only for full release
generateMapping() {
    echo "*** Bnk1.map... ***"
    cd ../mapping/
    ./generateCurrent.sh
    cd - > /dev/null
    echo
}
