doLogWarn() {
    if [ "$ldtl_logLevel_current" = "TRACE" ] ||
        [ "$ldtl_logLevel_current" = "DEBUG" ] ||
        [ "$ldtl_logLevel_current" = "INFO" ] ||
        [ "$ldtl_logLevel_current" = "WARN" ]; then
        doLog "WARN" $ldtl_logMessage
    fi
}
