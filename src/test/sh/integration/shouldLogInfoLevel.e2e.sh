#!/bin/bash

main() {
    cmd="$1 logInfo This is a test info message"
    if [ "$LDT_TEST_E2E_DEBUG_MODE" = "true" ]; then $cmd; fi

    if [ "$($cmd | grep 'INFO')" = "" ]; then
        if [ "$LDT_TEST_E2E_DEBUG_MODE" = "true" ]; then
            printf "{\n  cmd: \"$cmd\",\n  assert: \"Log level must be on info\"\n}\n"
        fi
        exit 400
    fi
    exit 0
}

main $1
