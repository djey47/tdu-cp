#!/usr/bin/env bash
#set -x

# Applies all full update mini matches onto current JSON database. Requires TDUF >= 1.3.0

source ../setEnv.sh

echo "Applying update mini patches to ${CURRENT_DB_PATH}, please wait..."
../tduf/databaseTool.sh apply-patches -n -j "${CURRENT_DB_PATH}" -o "${CURRENT_DB_PATH}" -p "${DIFF_PATCHES_PATH}"
