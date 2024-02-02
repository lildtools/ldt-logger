#!/bin/bash

main() {
    cmd="$1 logDebug"
    _run
    if [ ! "$?" -eq 0 ]; then exit 400; fi

    cmd="$1 logDebug "
    _run
    if [ ! "$?" -eq 0 ]; then exit 400; fi

    cmd="$1 logDebug  "
    _run
    if [ ! "$?" -eq 0 ]; then exit 400; fi

    cmd="$1 logDebug   "
    _run
    if [ ! "$?" -eq 0 ]; then exit 400; fi

    exit 0
}

_run() {
    if [ "$LDT_TEST_E2E_DEBUG_MODE" = "true" ]; then $cmd; fi

    if [ "$($cmd | grep 'logMessage (arg\*) is required!')" = "" ]; then
        if [ "$LDT_TEST_E2E_DEBUG_MODE" = "true" ]; then
            printf "{\n  cmd: \"$cmd\",\n  assert: \"Log fatal error message when logMessage is empty\"\n}\n"
        fi
        exit 400
    fi
}

main $1
