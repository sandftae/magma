#!/bin/bash
# shellcheck disable=SC2034
# ============================================================
# NAMESPACE: State
# DESCRIPTION: sets a system-level configuration value
# ============================================================

# stores a value in the global app configuration associative array
setAppConfig() {
    local key="$1"
    local value="$2"

    # force global associative array if not already set
#    if [[ "$(declare -p __APP_CONFIG 2>/dev/null)" != "declare -A"* ]]; then
#        declare -g -A __APP_CONFIG
#    fi

    # assign value
    __APP_CONFIG["$key"]="$value"
}