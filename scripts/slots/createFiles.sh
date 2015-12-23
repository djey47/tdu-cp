#!/usr/bin/env bash
#set -x

# Create required files for slots.

source ../setEnv.sh

DEFAULT_MODELS_PATH=${TDUCP_PATH}/resources/physics/vehicles/models
DEFAULT_SOUND_PATH=${TDUCP_PATH}/resources/physics/vehicles/sounds
DEFAULT_HUD_PATH=${TDUCP_PATH}/resources/physics/vehicles/huds
DEFAULT_RIM_PATH=${TDUCP_PATH}/resources/physics/vehicles/rims

BUILD_MODELS_PATH=${BUILD_BANK_PATH}/Vehicules
BUILD_RIMS_PATH=${BUILD_MODELS_PATH}/Rim
BUILD_SOUNDS_PATH=${BUILD_BANK_PATH}/Sound/Vehicules
BUILD_HUDS_HR_PATH=${BUILD_BANK_PATH}/FrontEnd/HiRes/Gauges
BUILD_HUDS_LR_PATH=${BUILD_BANK_PATH}/FrontEnd/LoRes/Gauges

echo "-> Creating build folders..."
mkdir -p ${BUILD_MODELS_PATH} ${BUILD_SOUNDS_PATH} ${BUILD_HUDS_HR_PATH} ${BUILD_HUDS_LR_PATH}

echo "-> Creating model and audio files..."
cat models.txt | while read name
do
   echo "-${name}"
   cp ${DEFAULT_MODELS_PATH}/DEFAULT.bnk ${BUILD_MODELS_PATH}/${name}.bnk
   cp ${DEFAULT_MODELS_PATH}/DEFAULT_I.bnk ${BUILD_MODELS_PATH}/${name}_I.bnk
   cp ${DEFAULT_SOUND_PATH}/DEFAULT_audio.bnk ${BUILD_SOUNDS_PATH}/${name}_audio.bnk
done

echo "-> Creating hud files..."
cat huds.txt | while read name
do
   echo "-${name}"
   cp ${DEFAULT_HUD_PATH}/DEFAULT.bnk ${BUILD_HUDS_HR_PATH}/${name}.bnk
   cp ${DEFAULT_HUD_PATH}/DEFAULT.bnk ${BUILD_HUDS_LR_PATH}/${name}.bnk
done

echo "-> Creating rim files..."
cat rims.txt | while read name
do
   echo "-${name}"
   PARENT_PATH=`dirname ${BUILD_RIMS_PATH}/${name}`
   mkdir -p ${PARENT_PATH}
   cp ${DEFAULT_RIM_PATH}/DEFAULT.bnk ${BUILD_RIMS_PATH}/${name}.bnk
done