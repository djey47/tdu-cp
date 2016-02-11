#!/usr/bin/env bash

# Runs TDUMT CLI BankInfo feature. Please run setEnv.sh script to initialize environment before launching this script.
# Arguments: Bank File Name

cd ${TDUF_PATH}/tools/tdumt-cli
mono ./tdumt-cli.exe BANK-I "$1"
cd - > /dev/null
