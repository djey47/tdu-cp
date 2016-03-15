#!/usr/bin/env bash
#set -x

# Applies all mini patches in provided directory onto current JSON database

source ../setEnv.sh

PATCH_DIR=$1

echo "Applying patches from $1 to ${CURRENT_DB_PATH}, please wait..."

../tduf/databaseTool.sh apply-patches -j "${CURRENT_DB_PATH}" -o "${CURRENT_DB_PATH}" -p "${PATCH_DIR}"
