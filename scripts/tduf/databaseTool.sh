#!/usr/bin/env bash

# Runs TDUF's DatabaseTool. Please run setEnv.sh script to initialize environment before launching this script.

cd ${TDUF_PATH}
java -cp ./lib/tduf-cli-all-${TDUF_VERSION}.jar fr.tduf.cli.tools.DatabaseTool "$@"
cd - > /dev/null
