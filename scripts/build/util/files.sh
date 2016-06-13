#!/usr/bin/env bash

# For full package: to replace existing files in TDU install while extracting ZIP
replacedFiles() {
    echo "*** 1.68b's Cameras ***"
    cp ${TDUCP_PATH}/resources/physics/1.68B-cameras/cameras.bin ${BUILD_DB_PATH}
    echo

    # Brand logos
    echo "*** Brand logos... ***"
    cp ${FULL_BANK_PATH}/FrontEnd/AllRes/LogoTexturePage.bnk ${BUILD_BANK_PATH}/FrontEnd/AllRes

    # Menu logo
    echo
    echo "*** Menu logo... ***"
    cp ${FULL_BANK_PATH}/FrontEnd/LowRes/LOG_IN.bnk ${BUILD_BANK_PATH}/FrontEnd/LowRes
    cp ${FULL_BANK_PATH}/FrontEnd/HiRes/LOG_IN.bnk ${BUILD_BANK_PATH}/FrontEnd/HiRes
    echo

    # Level files
    echo
    echo "*** Level files for Patch HD... ***"
    cp ${FULL_BANK_PATH}/Level/Hawai/CommonWorld.bnk ${BUILD_BANK_PATH}/Level/Hawai
    cp ${FULL_BANK_PATH}/Level/Hawai/CommonWorldDiv2.bnk ${BUILD_BANK_PATH}/Level/Hawai
    echo

    # Common vehicle textures
    echo
    echo "*** New license plates... ***"
    cp ${FULL_BANK_PATH}/Vehicules/Common_car.bnk ${BUILD_BANK_PATH}/Vehicules
    echo

    #Slot files
    slotFiles
}

# For both full and update packages: to replace existing files in TDU install while extracting ZIP
newFiles() {
    echo "*** Manifests... ***"
    cp ${TDUCP_PATH}/manifests/*.md ${MARKDOWN_SRC_PATH}
    echo

    echo "*** References... ***"
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

# For update package only: to copy to existing TDU install if non-existing, by Windows installer script
newFilesForUpdate() {
    newFiles
    slotFiles

    # Readme
    echo "*** Readme... ***"
    cp ${TDUCP_PATH}/manifests/update/*.md ${MARKDOWN_SRC_PATH}
    echo

    # Move slot files to installer paths
    mv ${BUILD_BANK_PATH}/Vehicules ${INSTALLER_BANK_PATH}
    mv ${BUILD_BANK_PATH}/Sound ${INSTALLER_BANK_PATH}
    mv ${BUILD_BANK_PATH}/FrontEnd/HiRes/Gauges ${INSTALLER_BANK_PATH}/FrontEnd/HiRes
    mv ${BUILD_BANK_PATH}/FrontEnd/LowRes/Gauges ${INSTALLER_BANK_PATH}/FrontEnd/LowRes
    rm -rf ${BUILD_BANK_PATH}/FrontEnd
}

newFilesForPatchHD() {
    # Readme
    echo "*** Readme... ***"
    cp ${TDUCP_PATH}/manifests/patch-hd/*.md ${MARKDOWN_SRC_PATH}
    echo

    # Patch HD modes directories
    echo "*** Tree... ***"
    mkdir -p ${INSTALLER_FILES_PATH}/OFF
    mkdir -p ${INSTALLER_FILES_PATH}/SD
    mkdir -p ${INSTALLER_FILES_PATH}/HD100
    mkdir -p ${INSTALLER_FILES_PATH}/HD300
    mkdir -p ${INSTALLER_FILES_PATH}/HD500
    mkdir -p ${INSTALLER_FILES_PATH}/HDU
    echo

    # FX.ini file
    echo "*** FX.ini... ***"
    unzip -o ${PATCH_HD_RESOURCES_PATH}/Genuine/FX.ini.tdu.zip FX.ini -d ${INSTALLER_FILES_PATH}/OFF
    unzip -o ${PATCH_HD_RESOURCES_PATH}/FX.ini.hd.zip FX.ini -d ${INSTALLER_FILES_PATH}/SD

    echo ${INSTALLER_FILES_PATH}/HD100 ${INSTALLER_FILES_PATH}/HD300 ${INSTALLER_FILES_PATH}/HD500 ${INSTALLER_FILES_PATH}/HDU | xargs -n 1 cp ${INSTALLER_FILES_PATH}/SD/FX.ini
    echo
}

# For full package only: to copy to existing TDU install, will replace files
newFilesForFull() {
    newFiles

    # Readme
    echo "*** Readme... ***"
    cp ${TDUCP_PATH}/manifests/full/readme-tducp-full.md ${BUILD_PATH}
    echo
}

# For update package only: replace in existing BNK files by Windows installer script
updatedPackedFiles() {
    INSTALLER_FILES_PATCHES_PATH=${INSTALLER_FILES_PATH}/patches
    mkdir -p ${INSTALLER_FILES_PATCHES_PATH}

    TEXTURES_LOW_PATH=${INSTALLER_FILES_PATCHES_PATH}/textures-low
    TEXTURES_HIGH_PATH=${INSTALLER_FILES_PATCHES_PATH}/textures-high
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
    cp ${TDUCP_PATH}/resources/system/2CV-patch-hd/SD/Library.3DD ${INSTALLER_FILES_PATCHES_PATH}
    echo
}

updatedPackedFilesForPatchHD() {
    echo "*** 3D Definition files for PATCH HD (SD MODE)... ***"
    cp ${PATCH_HD_RESOURCES_PATH}/Genuine/Library.3DD ${INSTALLER_FILES_PATH}/OFF
    cp ${PATCH_HD_RESOURCES_PATH}/SD/Library.3DD ${INSTALLER_FILES_PATH}/SD
    cp ${PATCH_HD_RESOURCES_PATH}/HD100/Library.3DD ${INSTALLER_FILES_PATH}/HD100
    cp ${PATCH_HD_RESOURCES_PATH}/HD300/Library.3DD ${INSTALLER_FILES_PATH}/HD300
    cp ${PATCH_HD_RESOURCES_PATH}/HD500/Library.3DD ${INSTALLER_FILES_PATH}/HD500
    cp ${PATCH_HD_RESOURCES_PATH}/HDU/Library.3DD ${INSTALLER_FILES_PATH}/HDU
    echo
}

# For full release only: mapping update will be performed by Windows installer script
generateMapping() {
    echo "*** Bnk1.map... ***"
    cd ../mapping/
    ./generateCurrent.sh
    ./fixCurrent.sh
    cd - > /dev/null
    echo
}

# For both full and update packages: files related to unlocked/new slots
slotFiles() {
    # Unlocked slot files
    echo "*** Unlocked slots files... ***"
    cd ../slots/unlocked
    ./createFiles.sh
    cd - > /dev/null
    echo

    # New slot files
    echo "*** New slots files... ***"
    cd ../slots/new
    ./createFiles.sh
    cd - > /dev/null
    echo

    # Own rims files
    echo "*** Own rims files... ***"
    cd ../slots/rims
    ./createFiles.sh
    cd - > /dev/null
    echo
}

makeZip() {
    echo "*** Zipping... ***"
    pushd ${BUILD_PATH} > /dev/null
    TIMESTAMP=`date +%s`
    7z a ${TDUCP_PATH}/workspace/releases/$1-${TIMESTAMP}.7z *
    popd > /dev/null
    echo
}

htmlDoc() {
    echo "*** Converting Markdown files to HTML... ***"
    pushd ${TDUCP_PATH}/tducp-scripts > /dev/null
    ./gradlew markdownToHtml
    popd > /dev/null
    cp ${TDUCP_PATH}/tducp-scripts/build/gen-html/*.html ${BUILD_PATH}
    echo
}

cleanBuild() {
    pushd ${TDUCP_PATH}/tducp-scripts > /dev/null
    ./gradlew clean
    popd > /dev/null
}