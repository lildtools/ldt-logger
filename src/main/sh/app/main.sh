#!/bin/bash

main() {
    parse $*
    load "${args[@]}"
    validate
    run
    if [ $? -ne 0 ]; then exit 500; fi
    exit 0
}
