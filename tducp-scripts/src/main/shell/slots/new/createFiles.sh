#!/usr/bin/env bash
#set -x

# Automatically launched via packaging scripts.
# Create new slot files for cars and bikes.

source ../../setEnv.sh


echo "-> Creating build folders..."
mkdir -p ${BUILD_MODELS_PATH} ${BUILD_SOUNDS_PATH} ${BUILD_HUDS_HR_PATH} ${BUILD_HUDS_LR_PATH}

echo "Creating default bank files..."

cat newSlotIds.txt | while read id
do
   BANKNAME=TDUCP_${id}

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
   for r in `seq 0 9`;
    do
        BANKNAME_RIMS_FRONT=TDUCP_${id}_F_0${r}
        BANKNAME_RIMS_REAR=TDUCP_${id}_R_0${r}
        echo "-${BANKNAME_RIMS_FRONT}"
        cp ${DEFAULT_RIM_PATH}/DEFAULT.bnk ${RIMS_PARENT_PATH}/${BANKNAME_RIMS_FRONT}.bnk
        echo "-${BANKNAME_RIMS_REAR}"
        cp ${DEFAULT_RIM_PATH}/DEFAULT.bnk ${RIMS_PARENT_PATH}/${BANKNAME_RIMS_REAR}.bnk
    done

   echo
done
