#!/usr/bin/env bash

# Runs TDUMT CLI batch BankRepack feature. Please run setEnv.sh script to initialize environment before launching this script.
# Arguments: Bank File Name, Batch Input File Name

cd ${TDUF_PATH}/tools/tdumt-cli
mono ./tdumt-cli.exe BANK-RX "$1" "$2"
cd - > /dev/null
