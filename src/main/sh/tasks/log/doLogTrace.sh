doLogTrace() {
    if [ "$ldtl_logLevel_current" = "TRACE" ]; then
        doLog "TRACE" $ldtl_logMessage
    fi
}
