#!/usr/bin/env bash
#set -x

source ../setEnv.sh

BANK_FILE=${TDUCP_PATH}/resources/physics/vehicles/huds/DEFAULT.bnk
CURRENT_DIR=`dirname $0`
CURRENT_DIR=`readlink -f ${CURRENT_DIR}`

echo "-> Bank info..."
bank-info.sh ${BANK_FILE}
echo

echo "-> Bank unpack..."
bank-unpack.sh ${BANK_FILE} D:\\Eden-Prog\\Games\\TestDrive\\Resources\\3Valid\\PC\\EURO\\FrontEnd\\Gauges\\hud01\\.ini\\hud ${CURRENT_DIR}
echo

echo "-> Bank repack..."
bank-repack.sh ${BANK_FILE} D:\\Eden-Prog\\Games\\TestDrive\\Resources\\3Valid\\PC\\EURO\\FrontEnd\\Gauges\\hud01\\.ini\\hud ${CURRENT_DIR}/hud.ini
echo
