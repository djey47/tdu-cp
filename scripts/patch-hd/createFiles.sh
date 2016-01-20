#!/usr/bin/env bash
#set -x

# Create files for patch HD (on-demand)

source ../setEnv.sh

BUILD_PATCH_HD_PATH=${TDUCP_PATH}/workspace/build/private/PATCH-HD-OD

echo "-> Creating build folders..."
cat modes.txt | while read mode
do
   echo "-${mode}"
   INI_PATH=${BUILD_PATCH_HD_PATH}/${mode}/Euro/Bnk/FX
   BANKS_PATH=${BUILD_PATCH_HD_PATH}/${mode}/Euro/Bnk/Level

   mkdir -p ${INI_PATH} ${BANKS_PATH}
done
