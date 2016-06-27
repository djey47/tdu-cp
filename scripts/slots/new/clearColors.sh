#!/usr/bin/env bash
#set -x

# To be launched once to fix database BEFORE generating new slots
# Removes existing exterior colors

source ../../setEnv.sh

NEW_SLOTS_PATCHES_PATH=${TDUCP_PATH}/database/patches/New\ vehicle\ slots/colors
CAR_COLORS_TEMPLATE_PATH=${NEW_SLOTS_PATCHES_PATH}/CarColors-clean-template.mini.json

PATCH_PARENT_PATH=/tmp/tducp-slots-colors
rm -rf ${PATCH_PARENT_PATH}
mkdir ${PATCH_PARENT_PATH}

cat newSlotIds.txt | while read id
do
   PATCH_NAME=TDUCP-SLOT_${id}.mini.json

   PATCH_PATH=${PATCH_PARENT_PATH}/${PATCH_NAME}
   PATCH_PROPERTIES_PATH=${PATCH_PATH}.properties

   echo "Generating ${PATCH_PROPERTIES_PATH}..."
   rm ${PATCH_PROPERTIES_PATH} 2> /dev/null

   echo "SLOTREF=${id}00000" >> ${PATCH_PROPERTIES_PATH}
   echo "INTREF=${id}9636" >> ${PATCH_PROPERTIES_PATH}

   echo >> ${PATCH_PROPERTIES_PATH}

   echo "Copying ${CAR_COLORS_TEMPLATE_PATH} and customizing car id..."
   cp "${CAR_COLORS_TEMPLATE_PATH}" "${PATCH_PATH}"
   sed -i "s/#ID#/${id}/g" ${PATCH_PATH}
   echo
done

echo "Applying patches from ${PATCH_PARENT_PATH} onto current database..."
../../tduf/databaseTool.sh apply-patches -p ${PATCH_PARENT_PATH} -j ${CURRENT_DB_PATH} -o ${CURRENT_DB_PATH}
