#!/usr/bin/env bash

# Customize this line to actual TDUF location (symlink is highly recommended!)
export TDUF_PATH=/opt/apps/tduf

# Below should not be modified
export TDUF_VERSION=`cat ${TDUF_PATH}/lib/version.info`

CURRENT_PATH=`pwd`
SCRIPTS_PATH=`dirname ${CURRENT_PATH}`
export TDUCP_PATH=`dirname ${SCRIPTS_PATH}`

export CURRENT_DB_PATH=${TDUCP_PATH}/database/current
export GENERATED_DB_PATH=${TDUCP_PATH}/workspace/wip/private/database-generated

export BUILD_BANK_PATH=${TDUCP_PATH}/workspace/build/private/2.00A/Euro/Bnk

export MAPPING_CURRENT=${BUILD_BANK_PATH}/Bnk1.map

export JSON_MAPPING_PATH=${TDUCP_PATH}/resources/system/magic-map/Bnk1.map.patched.json

export JSON_MAP4_STRUCTURE=${TDUF_PATH}/structures/MAP4-map.json

