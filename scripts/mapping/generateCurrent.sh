#!/usr/bin/env bash
#set -x

# Creates workspace/build/private/2.00A/Euro/Bnk/Bnk1.map file from latest JSON file.
# Requires Bnk1.map file as magic map into workspace/build/private/2.00A/Euro/Bnk directory.

source ../setEnv.sh

cd ${TDUF_PATH}

echo "-> Generating ${MAPPING_CURRENT} file from ${JSON_MAPPING_PATH}, please wait..."
java -cp ./lib/tduf-cli-all-${TDUF_VERSION}.jar fr.tduf.cli.tools.FileTool applyjson -n -i ${JSON_MAPPING_PATH} -o ${MAPPING_CURRENT} -s ${JSON_MAP4_STRUCTURE}
