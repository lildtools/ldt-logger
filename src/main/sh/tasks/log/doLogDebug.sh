doLogDebug() {
    if [ "$ldtl_logLevel_current" = "TRACE" ] ||
        [ "$ldtl_logLevel_current" = "DEBUG" ]; then
        doLog "DEBUG" $ldtl_logMessage
    fi
}
