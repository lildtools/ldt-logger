doLogInfo() {
    if [ "$ldtl_logLevel_current" = "TRACE" ] ||
        [ "$ldtl_logLevel_current" = "DEBUG" ] ||
        [ "$ldtl_logLevel_current" = "INFO" ]; then
        doLog "INFO" $ldtl_logMessage
    fi
}
