#!/usr/bin/env bash

deployTDUF() {
    echo "*** TDUF... ***"
    cp -rL ${TDUF_PATH} ${INSTALLER_LIB_PATH}
    echo
}