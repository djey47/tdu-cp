#!/usr/bin/env bash
#set -x

# To be launched to prepare database BEFORE packaging
# Generates property file for new slots and apply patch template onto it.

source ../../setEnv.sh

NEW_SLOTS_PATCHES_PATH=${TDUCP_PATH}/database/patches/New\ vehicle\ slots
CAR_SLOT_TEMPLATE_PATH=${NEW_SLOTS_PATCHES_PATH}/CarSlotTemplate.mini.json
BIKE_SLOT_TEMPLATE_PATH=${NEW_SLOTS_PATCHES_PATH}/BikeSlotTemplate.mini.json

PATCH_PARENT_PATH=/tmp/tducp-slots-new
rm -rf ${PATCH_PARENT_PATH}
mkdir ${PATCH_PARENT_PATH}

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

   PATCH_PATH=${PATCH_PARENT_PATH}/${PATCH_NAME}
   PATCH_PROPERTIES_PATH=${PATCH_PATH}.properties

   echo "Generating ${PATCH_PROPERTIES_PATH}..."
   rm ${PATCH_PROPERTIES_PATH} 2> /dev/null

   # Physics
   BANKNAME=TDUCP_${id}
   echo "SLOTREF=${id}00000" >> ${PATCH_PROPERTIES_PATH}
   echo "RES_BANKNAME=${id}567" >> ${PATCH_PROPERTIES_PATH}
   echo "RES_MODELNAME=${id}3407" >> ${PATCH_PROPERTIES_PATH}
   echo "RES_VERSIONNAME=${id}8427" >> ${PATCH_PROPERTIES_PATH}
   echo "BANKNAME=${BANKNAME}" >> ${PATCH_PROPERTIES_PATH}
   echo "MODELNAME=TDUCP Model ${id}" >> ${PATCH_PROPERTIES_PATH}
   echo "VERSIONNAME=Version ${id}" >> ${PATCH_PROPERTIES_PATH}
   echo "CARID=${id}" >> ${PATCH_PROPERTIES_PATH}

   # Rims
   for r in `seq 0 9`;
    do
       echo "RIMREF.${r}=0000${id}${r}" >> ${PATCH_PROPERTIES_PATH}
       echo "RES_RIMNAME.${r}=${id}${r}562" >> ${PATCH_PROPERTIES_PATH}
       echo "RIMNAME.${r}=TDUCP ${id} - rim set ${r}" >> ${PATCH_PROPERTIES_PATH}
       echo "RES_BANKNAME.FR.${r}=${id}${r}1512" >> ${PATCH_PROPERTIES_PATH}
       echo "BANKNAME.FR.${r}=TDUCP_${id}_F_0${r}" >> ${PATCH_PROPERTIES_PATH}
       echo "RES_BANKNAME.RR.${r}=${id}${r}2512" >> ${PATCH_PROPERTIES_PATH}
       echo "BANKNAME.RR.${r}=TDUCP_${id}_R_0${r}" >> ${PATCH_PROPERTIES_PATH}
    done

   # Ext Colors
   for c in `seq 0 9`;
    do
       echo "COLORID.M.${c}=54356127" >> ${PATCH_PROPERTIES_PATH}
       echo "COLORID.S.${c}=53356127" >> ${PATCH_PROPERTIES_PATH}
       echo "CALLIPERSID.${c}=53356127" >> ${PATCH_PROPERTIES_PATH}
       echo "RES_COLORNAME.${c}=${id}${c}457" >> ${PATCH_PROPERTIES_PATH}
       echo "COLORNAME.${c}=TDUCP_${id} exterior color ${c}" >> ${PATCH_PROPERTIES_PATH}
    done

   # Int Schemes
   for i in `seq 0 9`;
    do
       echo "INTREF.${i}=${id}${i}9636" >> ${PATCH_PROPERTIES_PATH}
       echo "INTCOLORID.M.${i}=53364643" >> ${PATCH_PROPERTIES_PATH}
       echo "INTCOLORID.S.${i}=53364643" >> ${PATCH_PROPERTIES_PATH}
       echo "INTMATERIALID.${i}=53364643" >> ${PATCH_PROPERTIES_PATH}
    done

   echo >> ${PATCH_PROPERTIES_PATH}

   echo "Copying ${SLOT_TEMPLATE_PATH} and customizing car id..."
   cp "${SLOT_TEMPLATE_PATH}" "${PATCH_PATH}"
   sed -i "s/#ID#/${id}/g" ${PATCH_PATH}
   echo
done

echo "Applying patches from ${PATCH_PARENT_PATH} onto current database..."
../../tduf/databaseTool.sh apply-patches -p ${PATCH_PARENT_PATH} -j ${CURRENT_DB_PATH} -o ${CURRENT_DB_PATH}
