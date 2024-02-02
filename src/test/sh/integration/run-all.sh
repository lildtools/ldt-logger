#!/bin/bash

main() {
    testRunner="/bin/bash"
    testPath=$(realpath $(dirname "${BASH_SOURCE[0]}")/)
    testEnv=$(realpath $(dirname "${BASH_SOURCE[0]}")/../../resources/test-e2e.env)
    testCase=$1
    if [ -f $testEnv ]; then export $(cat $testEnv | xargs); fi

    testReports=$(realpath $(dirname "${BASH_SOURCE[0]}")/../../../../docs)
    reportName=reports.html
    tableStyle="width:100%;border-collapse:collapse;margin-bottom:32px"
    captionStyle="text-align:left;font-weight:bolder"
    mkdir -p $testReports
    echo "<table style=\"$tableStyle\">" >>$testReports/$reportName
    echo "<caption style=\"$captionStyle\">E2E tests</caption>" >>$testReports/$reportName
    if [ "$testCase" = "" ]; then
        cmd=$(ls -a $testPath | grep .e2e.sh | xargs -I % echo "$testRunner $testPath/e2e-runner.sh \"%\" ; ")
        eval $cmd
    else
        export LDT_TEST_E2E_DEBUG_MODE=true
        $testRunner $testPath/e2e-runner.sh "$testCase.e2e.sh"
    fi
    echo "</table>" >>$testReports/$reportName
}

main $1
