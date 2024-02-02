validate() {
    if [ ! "$ldtl_logLevel_default" = "TRACE" ] &&
        [ ! "$ldtl_logLevel_default" = "DEBUG" ] &&
        [ ! "$ldtl_logLevel_default" = "INFO" ] &&
        [ ! "$ldtl_logLevel_default" = "WARN" ] &&
        [ ! "$ldtl_logLevel_default" = "ERROR" ]; then
        doLogFatal "default-logLevel ('$ldtl_logLevel_default') is invalid!"
        doLogFatal "logLevels = TRACE|DEBUG|INFO|WARN|ERROR"
        exit 500
    fi

    if [ ! "$LDT_LOGGER_LOGLEVEL" = "" ]; then
        ldtl_logLevel_current=$LDT_LOGGER_LOGLEVEL
    else
        ldtl_logLevel_current=$ldtl_logLevel_default
    fi

    if [ ! "$LDT_LOGGER_LOGPREFIX" = "" ]; then
        ldtl_logPrefix=$LDT_LOGGER_LOGPREFIX
    fi

    if [ ! "$LDT_LOGGER_LOGSEPARATOR" = "" ]; then
        ldtl_logSeparator=$LDT_LOGGER_LOGSEPARATOR
    fi

    if [ ! "$ldtl_logLevel_current" = "TRACE" ] &&
        [ ! "$ldtl_logLevel_current" = "DEBUG" ] &&
        [ ! "$ldtl_logLevel_current" = "INFO" ] &&
        [ ! "$ldtl_logLevel_current" = "WARN" ] &&
        [ ! "$ldtl_logLevel_current" = "ERROR" ]; then
        doLogFatal "current-logLevel ('$ldtl_logLevel_current') is invalid!"
        doLogFatal "logLevels = TRACE|DEBUG|INFO|WARN|ERROR"
        exit 500
    fi

    if [ "$ldtl_cmd" = "" ]; then ldtl_cmd=usage; fi
    if [ "$ldtl_cmd" = "-h" ]; then ldtl_cmd=usage; fi
    if [ "$ldtl_cmd" = "--help" ]; then ldtl_cmd=usage; fi
    if [ "$ldtl_cmd" = "-u" ]; then ldtl_cmd=usage; fi
    if [ "$ldtl_cmd" = "--usage" ]; then ldtl_cmd=usage; fi
    if [ "$ldtl_cmd" = "-v" ]; then ldtl_cmd=version; fi
    if [ "$ldtl_cmd" = "--version" ]; then ldtl_cmd=version; fi

    if [ "$ldtl_logMessage" = "" ]; then ldtl_cmd=usage; fi

    if [ ! "$ldtl_cmd" = "version" ] &&
        [ ! "$ldtl_cmd" = "usage" ] &&
        [ ! "$ldtl_cmd" = "logTrace" ] &&
        [ ! "$ldtl_cmd" = "logDebug" ] &&
        [ ! "$ldtl_cmd" = "logInfo" ] &&
        [ ! "$ldtl_cmd" = "logWarn" ] &&
        [ ! "$ldtl_cmd" = "logError" ]; then
        doLogFatal "cmd ('$ldtl_cmd') is invalid!"
        doLogFatal "commands = logTrace|logDebug|logInfo|logWarn|logError"
        exit 400
    fi
}
