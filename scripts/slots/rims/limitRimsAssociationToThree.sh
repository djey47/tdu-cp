#!/usr/bin/env bash
#set -x

# To be launched once to fix database BEFORE generating new slots
# Keep only 3 existing rims associations, do not delete rims themselves

source ../../setEnv.sh

NEW_SLOTS_PATCHES_PATH=${TDUCP_PATH}/database/patches/New\ vehicle\ slots/rims
RIMS_TEMPLATE_PATH=${NEW_SLOTS_PATCHES_PATH}/Rims-reset-association-template.mini.json

PATCH_PARENT_PATH=/tmp/tducp-slots-rims
rm -rf ${PATCH_PARENT_PATH}
mkdir ${PATCH_PARENT_PATH}

cat ../new/newSlotIds.txt | while read id
do
   PATCH_NAME=TDUCP-SLOT_${id}.mini.json

   PATCH_PATH=${PATCH_PARENT_PATH}/${PATCH_NAME}
   PATCH_PROPERTIES_PATH=${PATCH_PATH}.properties

   echo "Generating ${PATCH_PROPERTIES_PATH}..."
   rm ${PATCH_PROPERTIES_PATH} 2> /dev/null

   echo "SLOTREF=${id}00000" >> ${PATCH_PROPERTIES_PATH}

   for r in `seq 1 3`;
    do
       echo "RIMREF.${r}=0000${id}${r}" >> ${PATCH_PROPERTIES_PATH}
    done

   echo >> ${PATCH_PROPERTIES_PATH}

   echo "Copying ${RIMS_TEMPLATE_PATH} and customizing car id..."
   cp "${RIMS_TEMPLATE_PATH}" "${PATCH_PATH}"
   sed -i "s/#ID#/${id}/g" ${PATCH_PATH}
   echo
done

echo "Applying patches from ${PATCH_PARENT_PATH} onto current database..."
../../tduf/databaseTool.sh apply-patches -p ${PATCH_PARENT_PATH} -j ${CURRENT_DB_PATH} -o ${CURRENT_DB_PATH}
