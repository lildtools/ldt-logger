#!/bin/bash

main() {
    cmd="$1 --usage"
    if [ "$LDT_TEST_E2E_DEBUG_MODE" = "true" ]; then $cmd; fi

    if [ "$($cmd | grep 'USAGE: ldtl <task> message \[args\]')" = "" ]; then
        if [ "$LDT_TEST_E2E_DEBUG_MODE" = "true" ]; then
            printf "{\n  cmd: \"$cmd\",\n  assert: \"Logger usage must be printed to terminal\"\n}\n"
        fi
        exit 400
    fi
    exit 0
}

main $1
