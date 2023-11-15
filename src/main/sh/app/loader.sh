load() {
    ## load:variables
    ldtl_cmd=$1
    ldtl_console=echo
    ldtl_logLevel=""
    ldtl_logLevel_current=""
    ldtl_logLevel_default=ERROR
    ldtl_logSeparator="---"
    ldtl_logPrefix=LDTL
    ldtl_me=$(whoami)
    ldtl_now=$(date +"%Y-%m-%d %H:%M:%S.%3N")
    ldtl_workindDir=$PWD
    shift

    ldtl_logMessage="$*"

    ## load:environment
    if [ -f $ldtl_workindDir/.env ]; then
        export $(cat $ldtl_workindDir/.env | xargs)
    fi
    if [ -f $ldtl_workindDir/ldtl.env ]; then
        export $(cat $ldtl_workindDir/ldtl.env | xargs)
    fi
    if [ -f $ldtl_workindDir/ldt-logger.env ]; then
        export $(cat $ldtl_workindDir/ldt-logger.env | xargs)
    fi
}
