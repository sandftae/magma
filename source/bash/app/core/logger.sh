#!/bin/bash
# ============================================================
# NAMESPACE: Logger
# DESCRIPTION: handles system logging to a specific file
# ============================================================

# write message to log file
#
# @param string $level (INFO|DEBUG|ERROR)
# @param string $message
logWrite() {
    local level="$1"
    local message="$2"
    local logFile
    logFile="app.log"

    # write to file with timestamp
    echo "$(date '+%Y-%m-%d %H:%M:%S') [$level] $message" >> "$logFile"
}

logInfo()  { logWrite "INFO" "$1"; }
logDebug() { logWrite "DEBUG" "$1"; }
logError() { logWrite "ERROR" "$1"; }