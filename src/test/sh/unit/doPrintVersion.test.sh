#!/bin/bash

main() {
    runner=$(realpath $(dirname "${BASH_SOURCE[0]}")/unit-runner.sh)

    /bin/bash \
        $runner \
        tasks/doPrintVersion
}

main
