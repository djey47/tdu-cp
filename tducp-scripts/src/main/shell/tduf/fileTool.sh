#!/usr/bin/env bash

# Runs TDUF's FileTool. Please run setEnv.sh script to initialize environment before launching this script.

cd ${TDUF_PATH}
java -cp ./tools/lib/tduf-${TDUF_VERSION}.jar fr.tduf.cli.tools.FileTool "$@"
cd - > /dev/null
