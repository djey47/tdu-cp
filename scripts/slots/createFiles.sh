#!/usr/bin/env bash
#set -x

# Create required files for slots.

source ../setEnv.sh

DEFAULT_MODELS_PATH=${TDUCP_PATH}/resources/physics/vehicles/models
DEFAULT_SOUND_PATH=${TDUCP_PATH}/resources/physics/vehicles/sounds

BUILD_MODELS_PATH=${BUILD_BANK_PATH}/Vehicules
BUILD_SOUNDS_PATH=${BUILD_BANK_PATH}/Sound/Vehicules

echo "-> Creating build folders..."
mkdir -p ${BUILD_MODELS_PATH} ${BUILD_SOUNDS_PATH}

echo "-> Creating model and audio files..."
cat models.txt | while read name
do
   echo "-${name}"
   cp ${DEFAULT_MODELS_PATH}/DEFAULT.bnk ${BUILD_MODELS_PATH}/${name}.bnk
   cp ${DEFAULT_MODELS_PATH}/DEFAULT_I.bnk ${BUILD_MODELS_PATH}/${name}_I.bnk
   cp ${DEFAULT_SOUND_PATH}/DEFAULT_audio.bnk ${BUILD_SOUNDS_PATH}/${name}_audio.bnk
done