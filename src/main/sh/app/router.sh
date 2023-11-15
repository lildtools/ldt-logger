run() {
    if [ "$ldtl_cmd" = "version" ]; then doPrintVersion; fi
    if [ "$ldtl_cmd" = "usage" ]; then doPrintUsage; fi
    if [ "$ldtl_cmd" = "logTrace" ]; then doLogTrace; fi
    if [ "$ldtl_cmd" = "logDebug" ]; then doLogDebug; fi
    if [ "$ldtl_cmd" = "logInfo" ]; then doLogInfo; fi
    if [ "$ldtl_cmd" = "logWarn" ]; then doLogWarn; fi
    if [ "$ldtl_cmd" = "logError" ]; then doLogError; fi
}
