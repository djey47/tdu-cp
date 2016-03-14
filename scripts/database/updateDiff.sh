#!/usr/bin/env bash
#set -x

# Generates diff patches between current database and 1.66 MP one

source ../setEnv.sh

REFERENCE_DB_PATH=${TDUCP_PATH}/database/reference/1.66A_MP

echo "Getting diffs between current database and 1.66MP one, please wait..."
../tduf/databaseTool.sh diff-patches -n -j ${CURRENT_DB_PATH} -J ${REFERENCE_DB_PATH} -p ${DIFF_PATCHES_PATH}
