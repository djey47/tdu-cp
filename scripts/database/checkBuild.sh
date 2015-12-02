#!/usr/bin/env bash
#set -x

# Extracts database bank files from build into /tmp/tdu-cp/dbcheck directory.

source ../setEnv.sh

BUILD_DB_PATH=${TDUCP_PATH}/workspace/build/private/2.00A/Euro/Bnk/Database/
JSON_DB_PATH=/tmp/tdu-cp/dbcheck

cd ${TDUF_PATH}
java -cp ./lib/tduf-cli-all-${TDUF_VERSION}.jar fr.tduf.cli.tools.DatabaseTool unpack-all -n -d ${BUILD_DB_PATH} -j ${JSON_DB_PATH}