#!/usr/bin/env bash
#set -x

# Automatically launched via FULL packaging script.
# Create new slot files for cars and bikes.

source ../../setEnv.sh


echo "-> Creating build folders..."
mkdir -p ${BUILD_MODELS_PATH} ${BUILD_SOUNDS_PATH} ${BUILD_HUDS_HR_PATH} ${BUILD_HUDS_LR_PATH}

cat newSlotIds_phase3.txt | while read id
do
   BANKNAME=TDUCP_${id}
   BANKNAME_RIMS_FRONT=TDUCP_${id}_F_01
   BANKNAME_RIMS_REAR=TDUCP_${id}_R_01

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
