#!/usr/bin/env bash
#set -x

# Create brand new slots for cars and bikes.

source ../setEnv.sh

NEW_SLOTS_PATCHES_PATH=${TDUCP_PATH}/database/patches/New\ vehicle\ slots
CAR_SLOT_TEMPLATE_PATH=${NEW_SLOTS_PATCHES_PATH}/CarSlotTemplate.mini.json
BIKE_SLOT_TEMPLATE_PATH=${NEW_SLOTS_PATCHES_PATH}/BikeSlotTemplate.mini.json


echo "-> Cars..."
cat newSlotIds.txt | while read id
do
   echo "-${id}"

   PATCH_NAME=TDUCP-CAR_${id}.mini.json
   PATCH_PROPERTIES_PATH=/tmp/${PATCH_NAME}.properties
   PATCH_PATH=/tmp/${PATCH_NAME}

   echo "Generating ${PATCH_PROPERTIES_PATH}..."
   rm ${PATCH_PROPERTIES_PATH}
   # Physics
   echo "SLOTREF=00000${id}" >> ${PATCH_PROPERTIES_PATH}
   echo "RES_BANKNAME=${id}567" >> ${PATCH_PROPERTIES_PATH}
   echo "RES_MODELNAME=${id}3407" >> ${PATCH_PROPERTIES_PATH}
   echo "RES_VERSIONNAME=${id}8427" >> ${PATCH_PROPERTIES_PATH}
   echo "BANKNAME=TDUCP_${id}" >> ${PATCH_PROPERTIES_PATH}
   echo "MODELNAME=TDUCP Model ${id}" >> ${PATCH_PROPERTIES_PATH}
   echo "VERSIONNAME=Version ${id}" >> ${PATCH_PROPERTIES_PATH}
   echo "CARID=${id}" >> ${PATCH_PROPERTIES_PATH}
   # Rims
   echo "RIMREF.1=0000${id}1" >> ${PATCH_PROPERTIES_PATH}
   echo "RES_BANKNAME.FR.1=${id}1512" >> ${PATCH_PROPERTIES_PATH}
   echo "BANKNAME.FR.1=TDUCP_${id}_F_01" >> ${PATCH_PROPERTIES_PATH}
   echo "RES_BANKNAME.RR.1=${id}2512" >> ${PATCH_PROPERTIES_PATH}
   echo "BANKNAME.RR.1=TDUCP_${id}_R_01" >> ${PATCH_PROPERTIES_PATH}
   # Ext Colors
   echo "COLORID.M.1=54356127" >> ${PATCH_PROPERTIES_PATH}
   echo "COLORID.S.1=53356127" >> ${PATCH_PROPERTIES_PATH}
   echo "CALLIPERSID.1=53356127" >> ${PATCH_PROPERTIES_PATH}
   echo "RES_COLORNAME.1=${id}1457" >> ${PATCH_PROPERTIES_PATH}
   echo "COLORNAME.1=TDUCP_${id} exterior color 1" >> ${PATCH_PROPERTIES_PATH}
   # Int Schemes
   echo "INTREF.1=11319636" >> ${PATCH_PROPERTIES_PATH}
   echo "RES_INTNAME.1=${id}5512" >> ${PATCH_PROPERTIES_PATH}
   echo "INTNAME.1=TDUCP_${id} interior scheme 1" >> ${PATCH_PROPERTIES_PATH}
   echo "INTCOLORID.M.1=53364643" >> ${PATCH_PROPERTIES_PATH}
   echo "INTCOLORID.S.1=53364643" >> ${PATCH_PROPERTIES_PATH}
   echo "INTMATERIALID.1=53364643" >> ${PATCH_PROPERTIES_PATH}

   echo >> ${PATCH_PROPERTIES_PATH}

   echo "Copying ${CAR_SLOT_TEMPLATE_PATH}..."
   cp "${CAR_SLOT_TEMPLATE_PATH}" "${PATCH_PATH}"

   echo "Applying patch ${PATCH_PATH}..."
   #TODO

   #TODO Create files in workspace (model, audio, hud, rims)

done


echo "-> Bikes..."
#TODO