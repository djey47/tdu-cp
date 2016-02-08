#!/usr/bin/env bash
#set -x

# Create brand new slots and files for cars and bikes.
# Generates property file and apply patch template onto it.

source ../setEnv.sh

NEW_SLOTS_PATCHES_PATH=${TDUCP_PATH}/database/patches/New\ vehicle\ slots
CAR_SLOT_TEMPLATE_PATH=${NEW_SLOTS_PATCHES_PATH}/CarSlotTemplate.mini.json
BIKE_SLOT_TEMPLATE_PATH=${NEW_SLOTS_PATCHES_PATH}/BikeSlotTemplate.mini.json

cat newSlotIds.txt | while read id
do
   if [[ ${id} == 3* ]]; then
      echo "- ${id} (car slot)"
      PATCH_NAME=TDUCP-CAR_${id}.mini.json
      SLOT_TEMPLATE_PATH=${CAR_SLOT_TEMPLATE_PATH}
   elif [[ ${id} == 4* ]]; then
      echo "- ${id} (bike slot)"
      PATCH_NAME=TDUCP-BIKE_${id}.mini.json
      SLOT_TEMPLATE_PATH=${BIKE_SLOT_TEMPLATE_PATH}
   else
      echo "- ${id} (unsupported)"
      echo
      exit 1
   fi

   PATCH_PROPERTIES_PATH=/tmp/${PATCH_NAME}.properties
   PATCH_PATH=/tmp/${PATCH_NAME}

   echo "Generating ${PATCH_PROPERTIES_PATH}..."
   rm ${PATCH_PROPERTIES_PATH}
   # Physics
   BANKNAME=TDUCP_${id}
   echo "SLOTREF=00000${id}" >> ${PATCH_PROPERTIES_PATH}
   echo "RES_BANKNAME=${id}567" >> ${PATCH_PROPERTIES_PATH}
   echo "RES_MODELNAME=${id}3407" >> ${PATCH_PROPERTIES_PATH}
   echo "RES_VERSIONNAME=${id}8427" >> ${PATCH_PROPERTIES_PATH}
   echo "BANKNAME=${BANKNAME}" >> ${PATCH_PROPERTIES_PATH}
   echo "MODELNAME=TDUCP Model ${id}" >> ${PATCH_PROPERTIES_PATH}
   echo "VERSIONNAME=Version ${id}" >> ${PATCH_PROPERTIES_PATH}
   echo "CARID=${id}" >> ${PATCH_PROPERTIES_PATH}
   # Rims
   BANKNAME_RIMS_FRONT=TDUCP_${id}_F_01
   BANKNAME_RIMS_REAR=TDUCP_${id}_R_01
   echo "RIMREF.1=0000${id}1" >> ${PATCH_PROPERTIES_PATH}
   echo "RES_RIMNAME.1=${id}562" >> ${PATCH_PROPERTIES_PATH}
   echo "RIMNAME.1=TDUCP ${id} - rim set 1" >> ${PATCH_PROPERTIES_PATH}
   echo "RES_BANKNAME.FR.1=${id}1512" >> ${PATCH_PROPERTIES_PATH}
   echo "BANKNAME.FR.1=${BANKNAME_RIMS_FRONT}" >> ${PATCH_PROPERTIES_PATH}
   echo "RES_BANKNAME.RR.1=${id}2512" >> ${PATCH_PROPERTIES_PATH}
   echo "BANKNAME.RR.1=${BANKNAME_RIMS_REAR}" >> ${PATCH_PROPERTIES_PATH}
   # Ext Colors
   echo "COLORID.M.1=54356127" >> ${PATCH_PROPERTIES_PATH}
   echo "COLORID.S.1=53356127" >> ${PATCH_PROPERTIES_PATH}
   echo "CALLIPERSID.1=53356127" >> ${PATCH_PROPERTIES_PATH}
   echo "RES_COLORNAME.1=${id}1457" >> ${PATCH_PROPERTIES_PATH}
   echo "COLORNAME.1=TDUCP_${id} exterior color 1" >> ${PATCH_PROPERTIES_PATH}
   # Int Schemes
   echo "INTREF.1=${id}9636" >> ${PATCH_PROPERTIES_PATH}
   echo "RES_INTNAME.1=${id}5512" >> ${PATCH_PROPERTIES_PATH}
   echo "INTNAME.1=TDUCP_${id} interior scheme 1" >> ${PATCH_PROPERTIES_PATH}
   echo "INTCOLORID.M.1=53364643" >> ${PATCH_PROPERTIES_PATH}
   echo "INTCOLORID.S.1=53364643" >> ${PATCH_PROPERTIES_PATH}
   echo "INTMATERIALID.1=53364643" >> ${PATCH_PROPERTIES_PATH}

   echo >> ${PATCH_PROPERTIES_PATH}

   echo "Copying ${SLOT_TEMPLATE_PATH}..."
   cp "${SLOT_TEMPLATE_PATH}" "${PATCH_PATH}"

   echo "Applying patch ${PATCH_PATH} onto current database..."
   ../tduf/databaseTool.sh apply-patch -p ${PATCH_PATH} -j ${CURRENT_DB_PATH} -o ${CURRENT_DB_PATH}

   echo "Creating default bank files..."
   echo "-${BANKNAME}"
   # Ext/int models
   cp ${DEFAULT_MODELS_PATH}/DEFAULT.bnk ${BUILD_MODELS_PATH}/${BANKNAME}.bnk
   cp ${DEFAULT_MODELS_PATH}/DEFAULT_I.bnk ${BUILD_MODELS_PATH}/${BANKNAME}_I.bnk
   # Sound
   cp ${DEFAULT_SOUND_PATH}/DEFAULT_audio.bnk ${BUILD_SOUNDS_PATH}/${BANKNAME}_audio.bnk
   # HUDs
   cp ${DEFAULT_HUD_PATH}/DEFAULT.bnk ${BUILD_HUDS_HR_PATH}/${BANKNAME}.bnk
   cp ${DEFAULT_HUD_PATH}/DEFAULT.bnk ${BUILD_HUDS_LR_PATH}/${BANKNAME}.bnk
   # Rims
   RIMS_PARENT_PATH=${BUILD_RIMS_PATH}/Default
   mkdir -p "${RIMS_PARENT_PATH}"
   echo "-${BANKNAME_RIMS_FRONT}"
   cp ${DEFAULT_RIM_PATH}/DEFAULT.bnk ${RIMS_PARENT_PATH}/${BANKNAME_RIMS_FRONT}.bnk
   echo "-${BANKNAME_RIMS_REAR}"
   cp ${DEFAULT_RIM_PATH}/DEFAULT.bnk ${RIMS_PARENT_PATH}/${BANKNAME_RIMS_REAR}.bnk

   echo
done
