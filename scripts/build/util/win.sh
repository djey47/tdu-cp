#!/usr/bin/env bash

installerScript() {
    echo "*** Windows installer Script and libs... ***"

    cd ${TDUCP_PATH}/tducp-scripts && ./gradlew fatJar && cd -

    cp ${SCRIPTS_PATH}/install-win/* ${BUILD_PATH}
    cp ${TDUCP_PATH}/tducp-scripts/build/libs/*.jar ${INSTALLER_LIB_PATH}

    echo
}
