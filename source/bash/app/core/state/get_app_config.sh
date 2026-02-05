#!/bin/bash
# ============================================================
# NAMESPACE: State
# DESCRIPTION: retrieves a system-level configuration value
# ============================================================

# function getAppConfig
getAppConfig() {
    local key="$1"
    printf '%s' "${__APP_CONFIG["$key"]}"
}