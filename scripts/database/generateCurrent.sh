#!/usr/bin/env bash
#set -x

# Creates database bank files into /workspace/wip/database-generated directory from JSON files in database/current.
# Requires original- bank files to be present in database/current.

source ../setEnv.sh

CURRENT_DB_PATH=${TDUCP_PATH}/database/current

cd ${TDUF_PATH}
java -cp ./lib/tduf-cli-all-${TDUF_VERSION}.jar fr.tduf.cli.tools.DatabaseTool repack-all -j ${CURRENT_DB_PATH} -o ${GENERATED_DB_PATH}