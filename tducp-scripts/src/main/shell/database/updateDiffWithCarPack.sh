#!/usr/bin/env bash
#set -x

# Generates diff patches between current database and MegaCarPack one

source ../setEnv.sh

REFERENCE_DB_PATH=${TDUCP_PATH}/database/reference/Civicmanvtec-Milli-CarMegapack

echo "Getting diffs between current database and JPTH-Milli one, please wait..."
../tduf/databaseTool.sh diff-patches -n -j ${CURRENT_DB_PATH} -J ${REFERENCE_DB_PATH} -p ${DIFF_PATCHES_CARPACK_PATH}

echo "Deleting diff on PNJ topic..."
rm ${DIFF_PATCHES_CARPACK_PATH}/PNJ.mini.json

echo "All done!"
