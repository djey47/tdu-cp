#!/usr/bin/env bash
#set -x

# Applies all full update mini matches onto current JSON database

source ../setEnv.sh

echo "Applying update mini patches to ${CURRENT_DB_PATH}, please wait..."
find ${DIFF_PATCHES_PATH} -name *.json | sort | while read PATCH_FILE
do
    echo "-> Mini patch: ${PATCH_FILE}"
    ../tduf/databaseTool.sh apply-patch -n -j "${CURRENT_DB_PATH}" -o "${CURRENT_DB_PATH}" -p "${PATCH_FILE}"
    echo
done
