#!/bin/bash

main() {
    cmd="$1 logError This is a test error message"
    if [ "$LDT_TEST_E2E_DEBUG_MODE" = "true" ]; then $cmd; fi

    if [ "$($cmd | grep '\-\-\-')" = "" ]; then
        if [ "$LDT_TEST_E2E_DEBUG_MODE" = "true" ]; then
            printf "{\n  cmd: \"$cmd\",\n  assert: \"Log separator must be included in error message\"\n}\n"
        fi
        exit 400
    fi
    exit 0
}

main $1
