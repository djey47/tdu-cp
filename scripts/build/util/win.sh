#!/usr/bin/env bash

installerScript() {
    echo "*** Windows installer Script... ***"
    cp ${SCRIPTS_PATH}/install-win/* ${BUILD_PATH}
    echo
}
