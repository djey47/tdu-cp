#!/usr/bin/env bash

installerScript() {
    echo "*** Windows installer Script and libs... ***"
    cp ${SCRIPTS_PATH}/install-win/* ${BUILD_PATH}

    # Do not rebuild and copy jar if already present
    if [ ! -n "$(find ${INSTALLER_LIB_PATH} -name '*.jar')" ];
    then
        cd ${TDUCP_PATH}/tducp-scripts && ./gradlew fatJar && cd -
        cp ${TDUCP_PATH}/tducp-scripts/build/libs/*.jar ${INSTALLER_LIB_PATH}
    fi

    echo
}
