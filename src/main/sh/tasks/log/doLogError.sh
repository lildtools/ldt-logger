doLogError() {
    if [ "$ldtl_logLevel_current" = "TRACE" ] ||
        [ "$ldtl_logLevel_current" = "DEBUG" ] ||
        [ "$ldtl_logLevel_current" = "INFO" ] ||
        [ "$ldtl_logLevel_current" = "WARN" ] ||
        [ "$ldtl_logLevel_current" = "ERROR" ]; then
        doLog "ERROR" $ldtl_logMessage
    fi
}
