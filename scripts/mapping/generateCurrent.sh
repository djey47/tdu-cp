#!/usr/bin/env bash
#set -x

# Creates workspace/build/private/2.00A/Euro/Bnk/Bnk1.map file from latest JSON file.
# Requires Bnk1.map file as magic map into workspace/build/private/2.00A/Euro/Bnk directory.

source ../setEnv.sh

echo "Generating ${MAPPING_CURRENT} file from ${JSON_MAPPING_PATH}, please wait..."
../tduf/fileTool.sh applyjson -n -i ${JSON_MAPPING_PATH} -o ${MAPPING_CURRENT} -s ${JSON_MAP4_STRUCTURE}
