#!/bin/bash

main() {
    cmd="$1 logDebug This is a test debug message"
    if [ "$LDT_TEST_E2E_DEBUG_MODE" = "true" ]; then $cmd; fi

    if [ "$($cmd | grep 'DEBUG')" = "" ]; then
        if [ "$LDT_TEST_E2E_DEBUG_MODE" = "true" ]; then
            printf "{\n  cmd: \"$cmd\",\n  assert: \"Log level must be on debug\"\n}\n"
        fi
        exit 400
    fi
    exit 0
}

main $1
