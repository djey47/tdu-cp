#!/usr/bin/env bash

installerScript() {
    echo "*** Windows installer Script and libs... ***"
    cp ${CMD_SCRIPTS_PATH}/* ${BUILD_PATH}

    # Do not rebuild and copy jar if already present
    if [ ! -n "$(find ${INSTALLER_LIB_PATH} -maxdepth 1 -name '*.jar')" ];
    then
        cd ${TDUCP_PATH}/tducp-scripts && ./gradlew fatJar && cd - > /dev/null
        cp ${TDUCP_PATH}/tducp-scripts/build/libs/*.jar ${INSTALLER_LIB_PATH}
    fi

    echo
}
