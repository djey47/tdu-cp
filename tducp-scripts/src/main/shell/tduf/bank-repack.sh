#!/usr/bin/env bash

# Runs TDUMT CLI BankRepack feature. Please run setEnv.sh script to initialize environment before launching this script.
# Arguments: Bank File Name, Packed File Name, Repacked File Name

cd ${TDUF_PATH}/tools/tdumt-cli
mono ./tdumt-cli.exe BANK-R "$1" "$2" "$3"
cd - > /dev/null
