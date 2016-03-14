#!/usr/bin/env bash
#set -x

# Init script providing common variables, must be sourced in other scripts.

# Customize this line to actual TDUF location (symlink is highly recommended!)
export TDUF_PATH=/opt/apps/tduf

# Customize this line to actual TDUCP patch version (will be used as directory name)
export BUILD_PATCH_VERSION=2.00A


# Below should not be modified
export TDUF_VERSION=`cat ${TDUF_PATH}/lib/version.info`

CURRENT_PATH=`readlink -f $BASH_SOURCE`
SCRIPTS_PATH=`dirname ${CURRENT_PATH}`
export TDUCP_PATH=`dirname ${SCRIPTS_PATH}`

export CURRENT_DB_PATH=${TDUCP_PATH}/database/current
export GENERATED_DB_PATH=${TDUCP_PATH}/workspace/wip/private/database-generated

export BUILD_PATH=${TDUCP_PATH}/workspace/build/private/${BUILD_PATCH_VERSION}
export BUILD_BANK_PATH=${BUILD_PATH}/Euro/Bnk
export BUILD_TOOLS_PATH=${BUILD_PATH}/tools

export MAPPING_CURRENT=${BUILD_BANK_PATH}/Bnk1.map

export BUILD_DB_PATH=${BUILD_BANK_PATH}/Database
export BUILD_MODELS_PATH=${BUILD_BANK_PATH}/Vehicules
export BUILD_SOUNDS_PATH=${BUILD_BANK_PATH}/Sound/Vehicules
export BUILD_HUDS_HR_PATH=${BUILD_BANK_PATH}/FrontEnd/HiRes/Gauges
export BUILD_HUDS_LR_PATH=${BUILD_BANK_PATH}/FrontEnd/LowRes/Gauges
export BUILD_RIMS_PATH=${BUILD_MODELS_PATH}/Rim

export DEFAULT_MODELS_PATH=${TDUCP_PATH}/resources/physics/vehicles/models
export DEFAULT_SOUND_PATH=${TDUCP_PATH}/resources/physics/vehicles/sounds
export DEFAULT_HUD_PATH=${TDUCP_PATH}/resources/physics/vehicles/huds
export DEFAULT_RIM_PATH=${TDUCP_PATH}/resources/physics/vehicles/rims

export JSON_MAPPING_PATH=${TDUCP_PATH}/resources/system/magic-map/Bnk1.map.patched.json
export JSON_MAP4_STRUCTURE=${TDUF_PATH}/structures/MAP4-map.json
