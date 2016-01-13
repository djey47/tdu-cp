#!/usr/bin/env bash
#set -x

# Applies all mini patches provided in miniPatches.txt onto current JSON database

source ../setEnv.sh

echo "Applying patches to ${CURRENT_DB_PATH}, please wait..."
cat miniPatches.txt | while read PATCH
do
    PATCH_FILE=${TDUCP_PATH}/database/patches/${PATCH}

    echo "-> Mini patch: ${PATCH_FILE}"
    ../tduf/databaseTool.sh apply-patch -n -j "${CURRENT_DB_PATH}" -o "${CURRENT_DB_PATH}" -p "${PATCH_FILE}"
done
