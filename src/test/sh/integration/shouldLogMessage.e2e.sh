#!/bin/bash

main() {
    cmd="$1 logError \"This is a test error message\""
    if [ "$LDT_TEST_E2E_DEBUG_MODE" = "true" ]; then $cmd; fi

    versionFile=$(realpath $(dirname "${BASH_SOURCE[0]}")/../../../../VERSION)
    VERSION=$(cat $versionFile)
    result=$($cmd | grep ERROR)

    if [ "$result" = "" ]; then exit 400; fi
    exit 0
}

main $1
