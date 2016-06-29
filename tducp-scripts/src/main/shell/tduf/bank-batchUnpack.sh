#!/usr/bin/env bash

# Runs TDUMT CLI batch BankUnpack feature. Please run setEnv.sh script to initialize environment before launching this script.
# Arguments: Bank File Name, Batch Input File Name, [Target directory]

cd ${TDUF_PATH}/tools/tdumt-cli
mono ./tdumt-cli.exe BANK-UX "$1" "$2" "$3"
cd - > /dev/null
