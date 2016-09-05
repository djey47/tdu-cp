#!/usr/bin/env bash

# Runs TDUF's CameraTool. Please run setEnv.sh script to initialize environment before launching this script.

cd ${TDUF_PATH}
java -cp ./tools/lib/tduf-${TDUF_VERSION}.jar fr.tduf.cli.tools.CameraTool "$@"
cd - > /dev/null
