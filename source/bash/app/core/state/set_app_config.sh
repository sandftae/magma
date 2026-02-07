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

    # assign value
    __APP_CONFIG["$key"]="$value"
}