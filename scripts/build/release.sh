#!/usr/bin/env bash
#set -x

# Performs release of Community Patch
# Tag is defined as script parameter

source ../setEnv.sh

RELEASE_TAG=$1

echo "*** Previous releases ***"
git --no-pager log --date-order --graph --tags --simplify-by-decoration --pretty=format:'%ai %h %d'
echo
echo

echo "*** Creating tag: ${RELEASE_TAG} ***"
read -rsp $'Press any key to continue or CTRL-C to abort...\n' -n 1 key
git tag ${RELEASE_TAG}
echo

echo "*** Pushing tag to remote ***"
git push --tags
echo
