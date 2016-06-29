#!/usr/bin/env bash

# Runs TDUF's DatabaseEditor.

source ../setEnv.sh

cd ${TDUF_PATH}
java -cp ./tools/lib/tduf-${TDUF_VERSION}.jar fr.tduf.gui.database.DatabaseEditor "${CURRENT_DB_PATH}"
cd - > /dev/null
