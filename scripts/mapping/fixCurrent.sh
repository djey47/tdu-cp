#!/usr/bin/env bash
#set -x

# Add missing entries to current Bnk1.map file.
# Requires Bnk1.map file as magic map into workspace/build/private/2.00A/Euro/Bnk directory.

source ../setEnv.sh

cd ${TDUF_PATH}

echo "-> Searching for missing files from ${MAPPING_CURRENT}, please wait..."
java -cp ./lib/tduf-cli-all-${TDUF_VERSION}.jar fr.tduf.cli.tools.MappingTool list-missing -n -b ${BUILD_BANK_PATH}

echo "-> Fixing mapping file ${MAPPING_CURRENT}, please wait..."
java -cp ./lib/tduf-cli-all-${TDUF_VERSION}.jar fr.tduf.cli.tools.MappingTool fix-missing -n -b ${BUILD_BANK_PATH}

echo "-> Generating ${JSON_MAPPING_PATH} file from ${MAPPING_CURRENT}, please wait..."
java -cp ./lib/tduf-cli-all-${TDUF_VERSION}.jar fr.tduf.cli.tools.FileTool jsonify -n -i ${MAPPING_CURRENT} -o ${JSON_MAPPING_PATH} -s ${JSON_MAP4_STRUCTURE}
