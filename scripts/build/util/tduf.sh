#!/usr/bin/env bash

deployTDUF() {
    echo "*** TDUF... ***"
    cp -r ${TDUF_PATH} ${INSTALLER_PATH}
    echo
}