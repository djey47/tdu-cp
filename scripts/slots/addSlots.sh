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

   PATCH_SHORT_NAME=TDUCP-CAR_${id}
   PATCH_PROPERTIES_PATH=/tmp/${PATCH_SHORT_NAME}.properties
   PATCH_PATH=/tmp/${PATCH_SHORT_NAME}.mini.json

   echo "Generating ${PATCH_PROPERTIES_PATH}..."
   rm ${PATCH_PROPERTIES_PATH}
   echo "SLOTREF=00000${id}" >> ${PATCH_PROPERTIES_PATH}
   echo "RES_BANKNAME=${id}567" >> ${PATCH_PROPERTIES_PATH}
   echo "BANKNAME=TDUCP_${id}" >> ${PATCH_PROPERTIES_PATH}
   echo "RIMREF.1=0000${id}1" >> ${PATCH_PROPERTIES_PATH}
   echo "CARID=${id}" >> ${PATCH_PROPERTIES_PATH}
   echo "RES_BANKNAME.FR.1=${id}1512" >> ${PATCH_PROPERTIES_PATH}
   echo "BANKNAME.FR.1=TDUCP_${id}_F_01" >> ${PATCH_PROPERTIES_PATH}
   # TODO see to give a different id for rear file name
   echo "RES_BANKNAME.RR.1=${id}1512" >> ${PATCH_PROPERTIES_PATH}
   echo "BANKNAME.RR.1=TDUCP_${id}_R_01" >> ${PATCH_PROPERTIES_PATH}
   echo >> ${PATCH_PROPERTIES_PATH}

   echo "Copying ${CAR_SLOT_TEMPLATE_PATH}..."
   cp "${CAR_SLOT_TEMPLATE_PATH}" "${PATCH_PATH}"

   echo "Applying patch ${PATCH_PATH}..."
   #TODO

   #TODO Create files in workspace (model, audio, hud, rims)

done


echo "-> Bikes..."
#TODO