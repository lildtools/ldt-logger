#!/bin/bash

main() {
    cmd="$1 --version"
    if [ "$LDT_TEST_E2E_DEBUG_MODE" = "true" ]; then $cmd; fi

    versionFile=$(realpath $(dirname "${BASH_SOURCE[0]}")/../../../../VERSION)
    VERSION=$(cat $versionFile)

    if [ ! "$($cmd)" = "ldt-logger v$VERSION" ]; then
        if [ "$LDT_TEST_E2E_DEBUG_MODE" = "true" ]; then
            printf "{\n  cmd: \"$cmd\",\n  assert: \"Logger version must be printed to terminal\"\n}\n"
        fi
        exit 400
    fi
    exit 0
}

main $1
