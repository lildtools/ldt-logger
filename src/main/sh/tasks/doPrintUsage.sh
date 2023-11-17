doPrintUsage() {
echo "=============================================
USAGE: ldtl <task> "message" [args]

tasks:
  logDebug  -  log debug level messages to the console output
  logError  -  log error level messages to the console output
  logInfo   -  log information level messages to the console output
  logTrace  -  log trace level messages to the console output
  logWarn   -  log warning level messages to the console output
  usage     -  prints the usage informations to the console
  version   -  prints the app-version to the console

args:
  --debug   -  allow to print more informative debug informations to the console
"
}
