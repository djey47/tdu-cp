#!/usr/bin/env bash

# Runs TDUF's MappingTool. Please run setEnv.sh script to initialize environment before launching this script.

cd ${TDUF_PATH}
java -cp ./tools/lib/tduf.jar fr.tduf.cli.tools.MappingTool "$@"
cd - > /dev/null
