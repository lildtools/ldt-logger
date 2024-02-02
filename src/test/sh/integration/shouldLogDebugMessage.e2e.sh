#!/bin/bash

main() {
    cmd="$1 logDebug This is a test debug message"
    if [ "$LDT_TEST_E2E_DEBUG_MODE" = "true" ]; then $cmd; fi

    if [ "$($cmd | grep 'This is a test debug message')" = "" ]; then
        if [ "$LDT_TEST_E2E_DEBUG_MODE" = "true" ]; then
            printf "{\n  cmd: \"$cmd\",\n  assert: \"Log message must be equals to 'This is a test debug message'\"\n}\n"
        fi
        exit 400
    fi
    exit 0
}

main $1
