#!/usr/bin/env bash
#set -x

# Add missing entries to current Bnk1.map file.
# Requires Bnk1.map file as magic map into workspace/build/private/2.00A/Euro/Bnk directory.

source ../setEnv.sh

echo "-> Searching for missing files from ${MAPPING_CURRENT}, please wait..."
../tduf/mappingTool.sh list-missing -n -b ${BUILD_BANK_PATH}

echo "-> Fixing mapping file ${MAPPING_CURRENT}, please wait..."
../tduf/mappingTool.sh fix-missing -n -b ${BUILD_BANK_PATH}

echo "-> Generating ${JSON_MAPPING_PATH} file from ${MAPPING_CURRENT}, please wait..."
../tduf/fileTool.sh jsonify -n -i ${MAPPING_CURRENT} -o ${JSON_MAPPING_PATH} -s ${JSON_MAP4_STRUCTURE}
