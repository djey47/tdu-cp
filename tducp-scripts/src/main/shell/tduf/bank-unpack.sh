#!/usr/bin/env bash

# Runs TDUMT CLI BankUnpack feature. Please run setEnv.sh script to initialize environment before launching this script.
# Arguments: Bank File Name, Packed File Name, Target directory

cd ${TDUF_PATH}/tools/tdumt-cli
mono ./tdumt-cli.exe BANK-U "$1" "$2" "$3"
cd - > /dev/null
