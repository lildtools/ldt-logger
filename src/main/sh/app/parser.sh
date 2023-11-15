parse() {
    args=()

    for arg in "$@"; do
        case "$arg" in
        --debug)
            LDT_LOGGER_DEBUG_MODE=true
            ;;
        *)
            args+=($arg)
            ;;
        esac
    done
}
