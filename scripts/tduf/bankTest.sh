#!/usr/bin/env bash
#set -x

source ../setEnv.sh

echo "-> Bank info..."

../tduf/bank-info.sh ${TDUCP_PATH}/resources/physics/vehicles/huds/DEFAULT.bnk
