#!/bin/bash

main() {
    runner=$(realpath $(dirname "${BASH_SOURCE[0]}")/unit-runner.sh)

    testEnv="$testEnv   doLogFatal() {"
    testEnv="$testEnv     echo \$*;"
    testEnv="$testEnv   } ; "
    testEnv="$testEnv   ldtl_logMessage=\"This is a test message\";"
    testEnv="$testEnv   ldtl_console=echo;"
    testEnv="$testEnv   ldtl_logPrefix=LDTL;"
    testEnv="$testEnv   ldtl_logLevel_current=TRACE;"
    testEnv="$testEnv   ldtl_logSeparator=\"---\";"
    testEnv="$testEnv   ldtl_now=\"$(date +"%Y-%m-%d %H:%M:%S.%3N")\";"

    testArgs="$testArgs TRACE"

    /bin/bash \
        $runner \
        "tasks/log/doLog" "$testEnv" "$testArgs"

    if [ ! "$?" -eq 0 ]; then exit 400; fi
    exit 0
}

main
