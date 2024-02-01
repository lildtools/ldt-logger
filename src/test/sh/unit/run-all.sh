#!/bin/bash

main() {
    testRunner="/bin/bash"
    testPath=$(realpath $(dirname "${BASH_SOURCE[0]}")/)
    testEnv=$(realpath $(dirname "${BASH_SOURCE[0]}")/../../resources/test-unit.env)
    unit=$1
    if [ -f $testEnv ]; then export $(cat $testEnv | xargs); fi

    testReports=$(realpath $(dirname "${BASH_SOURCE[0]}")/../../../../docs)
    reportName=reports.html
    tableStyle="width:100%;border-collapse:collapse;margin-bottom:32px"
    captionStyle="text-align:left;font-weight:bolder"
    mkdir -p $testReports
    echo "<table style=\"$tableStyle\">" >>$testReports/$reportName
    echo "<caption style=\"$captionStyle\">Unit tests</caption>" >>$testReports/$reportName
    if [ "$unit" = "" ]; then
        cmd=$(ls -a $testPath | grep .test.sh | xargs -I % echo "$testRunner $testPath/% ; ")
        eval $cmd
    else
        $testRunner $testPath/$unit.test.sh
    fi
    echo "</table>" >>$testReports/$reportName
}

main $1
