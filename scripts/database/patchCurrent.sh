#!/usr/bin/env bash
#set -x

# Applies all mini patches provided in miniPatches.txt onto current JSON database

source ../setEnv.sh

echo "Applying patches to ${CURRENT_DB_PATH}, please wait..."
cat miniPatches.txt | while read PATCH
do
    PATCH_FILE=${TDUCP_PATH}/database/patches/${PATCH}

    echo "-> Mini patch: ${PATCH_FILE}"
    cd ${TDUF_PATH}
    java -cp ./lib/tduf-cli-all-${TDUF_VERSION}.jar fr.tduf.cli.tools.DatabaseTool apply-patch -n -j "${CURRENT_DB_PATH}" -o "${CURRENT_DB_PATH}" -p "${PATCH_FILE}"
done

