#!/usr/bin/env bash

# Customize this line to actual TDUF location (symlink is highly recommended!)
export TDUF_PATH=/opt/apps/tduf

# Below should not be modified
export TDUF_VERSION=`cat ${TDUF_PATH}/lib/version.info`

CURRENT_PATH=`pwd`
SCRIPTS_PATH=`dirname ${CURRENT_PATH}`
export TDUCP_PATH=`dirname ${SCRIPTS_PATH}`

export GENERATED_DB_PATH=${TDUCP_PATH}/workspace/wip/private/database-generated
