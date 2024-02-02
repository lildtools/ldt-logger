#!/bin/bash

main() {
    cmd="$1 logWarn This is a test warning message"
    if [ "$LDT_TEST_E2E_DEBUG_MODE" = "true" ]; then $cmd; fi

    if [ "$($cmd | grep '\[LDTL\]')" = "" ]; then
        if [ "$LDT_TEST_E2E_DEBUG_MODE" = "true" ]; then
            printf "{\n  cmd: \"$cmd\",\n  assert: \"Log prefix must be included in warning message\"\n}\n"
        fi
        exit 400
    fi
    exit 0
}

main $1
