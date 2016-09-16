#!/usr/bin/env bash
#set -x

# Generates diff patches between MegaCarPack  and current one

source ../setEnv.sh

CURRENT_DB_PATH=${TDUCP_PATH}/database/reference/Civicmanvtec-Milli-CarMegapack
REFERENCE_DB_PATH=${TDUCP_PATH}/database/current

echo "Getting diffs between current database and Civicmanvtec-Milli one, please wait..."
../tduf/databaseTool.sh diff-patches -n -j ${CURRENT_DB_PATH} -J ${REFERENCE_DB_PATH} -p ${DIFF_PATCHES_CARPACK_PATH}

echo "Deleting diff on PNJ topic..."
rm ${DIFF_PATCHES_CARPACK_PATH}/PNJ.mini.json

echo "All done!"
