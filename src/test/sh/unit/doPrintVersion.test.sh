#!/bin/bash

main() {
    runner=$(realpath $(dirname "${BASH_SOURCE[0]}")/unit-runner.sh)

    /bin/bash \
        $runner \
        tasks/doPrintVersion

    if [ ! "$?" -eq 0 ]; then exit 400; fi
    exit 0
}

main
