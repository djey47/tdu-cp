#!/usr/bin/env bash
#set -x

# - Creates ${MAPPING_CURRENT} (Bnk1.map) file from latest JSON file.
# - Add missing entries to current Bnk1.map file
# - Update Map as JSON file

#source ../setEnv.sh

echo "-> Generating ${MAPPING_CURRENT} file from ${JSON_MAPPING_PATH}, please wait..."
../tduf/fileTool.sh applyjson -n -i ${JSON_MAPPING_PATH} -o ${MAPPING_CURRENT} -s ${JSON_MAP4_STRUCTURE}

echo "-> Searching for missing files from ${MAPPING_CURRENT}, please wait..."
../tduf/mappingTool.sh list-missing -n -b ${BUILD_BANK_PATH}

echo "-> Fixing mapping file ${MAPPING_CURRENT}, please wait..."
../tduf/mappingTool.sh fix-missing -n -b ${BUILD_BANK_PATH}

echo "-> Generating ${JSON_MAPPING_PATH} file from ${MAPPING_CURRENT}, please wait..."
../tduf/fileTool.sh jsonify -n -i ${MAPPING_CURRENT} -o ${JSON_MAPPING_PATH} -s ${JSON_MAP4_STRUCTURE}
