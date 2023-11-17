doLog() {
    if [ "$LDT_LOGGER_DEBUG_MODE" = "true" ]; then
        $ldtl_console "-- ldtl_me=$ldtl_me"
        $ldtl_console "-- ldtl_cmd=$ldtl_cmd"
        $ldtl_console "-- ldtl_workindDir=$ldtl_workindDir"
        $ldtl_console "-- ldtl_console=$ldtl_console"
        $ldtl_console "-- ldtl_logPrefix=$ldtl_logPrefix"
        $ldtl_console "-- ldtl_logLevel=$ldtl_logLevel"
        $ldtl_console "-- ldtl_now=$ldtl_now"
        $ldtl_console "-- ldtl_logSeparator=$ldtl_logSeparator"
        $ldtl_console "-- ldtl_logMessage=$ldtl_logMessage"
    fi

    ldtl_logLevel=$1
    if [ "$ldtl_logLevel" = "" ]; then
        doLogFatal "logLevel (arg1) is required!"
        exit 500
    fi

    if [ "$ldtl_logMessage" = "" ]; then
        doLogFatal "logMessage (arg*) is required!"
        exit 500
    fi

    if [ ! "$ldtl_logLevel" = "FATAL" ] &&
        [ ! "$ldtl_logLevel" = "TRACE" ] &&
        [ ! "$ldtl_logLevel" = "DEBUG" ] &&
        [ ! "$ldtl_logLevel" = "INFO" ] &&
        [ ! "$ldtl_logLevel" = "WARN" ] &&
        [ ! "$ldtl_logLevel" = "ERROR" ]; then
        doLogFatal "logLevel ('$ldtl_logLevel') is invalid!"
        exit 400
    fi

    if [ "$ldtl_logLevel" = "WARN" ] ||
        [ "$ldtl_logLevel" = "INFO" ]; then
        ldtl_logLevel=" $ldtl_logLevel"
    fi

    $ldtl_console \
        "[$ldtl_logPrefix] $ldtl_logLevel $ldtl_now $ldtl_logSeparator $ldtl_logMessage"
}
